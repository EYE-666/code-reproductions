# 运行环境

本目录中的文件直接来自本次 AutoDL 实验实例：

- `code_commit.txt`：实验所用 `llm-attacks` 代码提交。
- `gpu_info.txt`：实验启动前的 `nvidia-smi` 输出。
- `pip_freeze.txt`：Python环境完整依赖列表。

主要软件版本：

- PyTorch 2.0.0 + CUDA 11.8
- Transformers 4.31.0
- Tokenizers 0.13.3
- FastChat (`fschat`) 0.2.23
- Python 3.8

GPU驱动显示CUDA 13.2为驱动支持上限；PyTorch实际使用的是CUDA 11.8构建。
