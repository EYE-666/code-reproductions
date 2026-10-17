# 论文代码复现

集中整理论文复现实验的运行命令、环境配置、实验日志与结果。每个实验放在独立子目录中。

## 实验目录

| 论文 / 方法 | 实验 | 内容 |
| --- | --- | --- |
| GCG · Vicuna-7B | [Algorithm 1：单行为实验](gcg/algorithm1-single-behavior/) | 单模型、单行为、500 步实验；运行环境、命令、指标、日志及实验学习记录 |
| GCG · Vicuna-7B | [Individual Attack：250 条行为实验](gcg/individual-250/) | 250 条行为的实验结果、逐项指标、汇总、运行脚本及环境信息 |

## 如何使用

先打开对应实验的 README，查看实验范围、依赖和运行方法。每个子目录保留原仓库的文件布局；使用相对路径时，以对应实验子目录为工作目录。

当前两个实验保存的是复现材料与结果，上游算法代码和模型权重的获取方式见各自说明。

## 论文学习笔记

论文阅读、文献汇报和阅读计划统一放在 [paper-study-notes](https://github.com/EYE-666/paper-study-notes)。

- [GCG 学习材料](https://github.com/EYE-666/paper-study-notes/tree/main/gcg)
- [Sleeper Attack 学习笔记](https://github.com/EYE-666/paper-study-notes/tree/main/sleeper-attack)

## 新实验的整理方式

按 `论文或方法/实验名称/` 新建目录，在目录内保留独立 README、环境说明、运行入口和结果，并更新上方实验目录。

## 来源与历史

2026-10-17 按类别合并整理。各子目录保留原文件内容与提交历史；下列旧仓库作为归档入口保留。后续更新集中在本仓库。

| 当前目录 | 原仓库 | 迁入版本 |
| --- | --- | --- |
| [gcg/algorithm1-single-behavior](gcg/algorithm1-single-behavior/) | [vicuna-gcg-algorithm1-reproduction](https://github.com/EYE-666/vicuna-gcg-algorithm1-reproduction) | [454f1a9](https://github.com/EYE-666/vicuna-gcg-algorithm1-reproduction/commit/454f1a9541ef7169784f7df2a34a8ec4680a6cd7) |
| [gcg/individual-250](gcg/individual-250/) | [vicuna-gcg-individual-250](https://github.com/EYE-666/vicuna-gcg-individual-250) | [0e73e6d](https://github.com/EYE-666/vicuna-gcg-individual-250/commit/0e73e6dd86235ac0c6535bb64dd5597cd5379358) |
