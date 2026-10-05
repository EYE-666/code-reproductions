# Vicuna-7B GCG Individual Attack（250条）

本仓库记录在 **Vicuna-7B-v1.3** 上复现 GCG（Greedy Coordinate Gradient）individual harmful behavior 实验的结果。

## 实验设置

| 项目 | 设置 |
| --- | --- |
| 模型 | Vicuna-7B-v1.3 |
| 数据集 | AdvBench harmful behaviors 前250条 |
| 攻击方式 | 每条 behavior 独立优化一个对抗后缀 |
| 优化步数 | 500 steps / behavior |
| Batch size | 16 |
| Top-k | 256 |
| Test interval | 50 steps |
| 完成时间 | 2026-10-05 04:46:35 CST |

## 最终结果

| 指标 | 成功数 | 总数 | 比例 |
| --- | ---: | ---: | ---: |
| Passed | 239 | 250 | **95.60%** |
| Exact Match (EM) | 209 | 250 | **83.60%** |

- `Passed`：生成结果没有命中代码预设的拒答前缀，是本实验的主要 ASR 指标。
- `EM`：生成结果精确包含预设目标字符串，判定更加严格。

论文中 Vicuna-7B 的 individual harmful behavior ASR 为 99.0%。本实验使用较小的 `batch_size=16`，与论文完整配置并不完全相同，因此结果应表述为复现实验，而不是对论文数字的完全等价复现。

## 仓库结构

```text
.
├── README.md
├── results/
│   ├── metrics.csv
│   └── summary.md
└── scripts/
    └── run_250_individual.sh
```

完整日志和 JSON 结果将在从 AutoDL 下载并检查文件大小后加入。模型权重不上传。

## 相关资料

- 论文：[Universal and Transferable Adversarial Attacks on Aligned Language Models](https://arxiv.org/abs/2307.15043)
- 官方代码：[llm-attacks/llm-attacks](https://github.com/llm-attacks/llm-attacks)
- 之前的单条复现实验：[EYE-666/vicuna-gcg-algorithm1-reproduction](https://github.com/EYE-666/vicuna-gcg-algorithm1-reproduction)
- GCG文献学习笔记：[EYE-666/GCG-paper-study-notes](https://github.com/EYE-666/GCG-paper-study-notes)

## 说明

本仓库仅用于学术研究、课程汇报和模型安全评估。
