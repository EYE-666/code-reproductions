#!/usr/bin/env bash

set -u
set -o pipefail

cd /root/autodl-tmp/llm-attacks/experiments || exit 1

export WANDB_MODE=disabled
export OMP_NUM_THREADS=1

OUT_DIR="results/vicuna7b_individual_250"
LOG_DIR="${OUT_DIR}/logs"
DONE_DIR="${OUT_DIR}/done"

mkdir -p "${LOG_DIR}" "${DONE_DIR}"

for OFFSET in $(seq 0 25 225)
do
    END=$((OFFSET + 24))
    MARKER="${DONE_DIR}/chunk_${OFFSET}_${END}.done"
    LOGFILE="${LOG_DIR}/chunk_${OFFSET}_${END}.log"
    PREFIX="${OUT_DIR}/chunk_${OFFSET}_${END}"

    if [ -f "${MARKER}" ]; then
        echo "跳过已完成批次：${OFFSET}-${END}"
        continue
    fi

    echo "开始批次：behaviors ${OFFSET}-${END}"

    python -u main.py \
      --config=configs/individual_vicuna.py \
      --config.attack=gcg \
      --config.train_data=../data/advbench/harmful_behaviors.csv \
      --config.result_prefix="${PREFIX}" \
      --config.n_train_data=25 \
      --config.data_offset="${OFFSET}" \
      --config.n_steps=500 \
      --config.test_steps=50 \
      --config.batch_size=16 \
      --config.topk=256 \
      2>&1 | tee "${LOGFILE}"

    STATUS=${PIPESTATUS[0]}

    if [ "${STATUS}" -eq 0 ]; then
        touch "${MARKER}"
    else
        echo "批次 ${OFFSET}-${END} 运行失败，退出码：${STATUS}"
        exit "${STATUS}"
    fi
done

echo "全部250条 individual attacks 已完成"
