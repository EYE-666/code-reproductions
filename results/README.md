# 结果文件说明

- `raw/`：10个原始JSON，每个包含25条behavior的优化记录。
- `per_behavior_summary.csv`：从每条behavior的第500步记录提取的逐条结果。
- `chunk_summary.csv`：每25条一组的Passed和EM统计。
- `metrics.csv`：全局汇总指标。
- `summary.md`：便于阅读和汇报的实验摘要。

`per_behavior_summary.csv` 不重复收录harmful behavior文本和对抗后缀，需要核验时可通过 `json_file` 和 `final_record_index` 定位到原始JSON。

本次压缩包内的完整控制台日志解压后约220MB，不放入GitHub。这些日志主要用于排错，统计和复核所需数据已由原始JSON保留。
