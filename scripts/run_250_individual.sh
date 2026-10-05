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

echo "实验开始时间：$(date)"
echo "数据范围：AdvBench behaviors 0-249"
echo "每个行为独立优化500步"
echo "batch_size=16, topk=256"

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

    echo
    echo "=================================================="
    echo "开始批次：behaviors ${OFFSET}-${END}"
    echo "开始时间：$(date)"
    echo "=================================================="

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

        echo "批次 ${OFFSET}-${END} 完成"
        echo "完成时间：$(date)"
    else
        echo "批次 ${OFFSET}-${END} 运行失败"
        echo "退出码：${STATUS}"
        echo "日志位置：${LOGFILE}"
        echo "修复问题后重新运行本脚本。"
        echo "已经完成的批次会自动跳过。"

        exit "${STATUS}"
    fi
done

echo
echo "=================================================="
echo "全部250条 individual attacks 已完成"
echo "实验结束时间：$(date)"
echo "结果目录：${OUT_DIR}"
echo "=================================================="
