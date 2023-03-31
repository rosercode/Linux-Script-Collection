该仓库收集了一些在Linux系统上执行各种任务所需的常用脚本。这些脚本都是使用Shell编写的，可以帮助您轻松完成许多不同的任务。

## 目录

该仓库包含以下脚本：

- `port-killer`: 用于通过端口杀掉相关的进程。
- `compile-C`: 用于编译和运行C代码。
- 等等

## 如何使用

要使用这些脚本，您可以按照以下步骤操作：

1. 将仓库克隆到您的本地机器上：

```bash
git clone https://github.com/rosercode/Linux-Script-Collection.git
```

2. 打开您的shell的配置文件（例如`~/.bashrc`或`~/.zshrc`）：

```bash
nano ~/.bashrc
```

3. 在文件的末尾添加以下内容，将脚本目录添加到PATH变量中：

```bash
export PATH=$PATH:/path/to/Linux-Script-Collection
```

请将上述命令中的`/path/to/Linux-Script-Collection`替换为您实际放置该仓库的路径。

4. 重新加载shell配置文件：

```bash
source ~/.bashrc
```

5. 现在您可以在任何地方使用这些脚本。只需输入脚本名称即可运行：

```bash
script1.sh
```

## 贡献

如果您有自己编写的脚本，并且认为它们可以对其他人有所帮助，请随时向该仓库提交拉取请求。请在您的拉取请求中包含以下内容：

- 新脚本的名称和简要说明。
- 您的脚本在哪个目录中放置。
- 如有必要，请提供使用说明或示例。

我们将会审查您的拉取请求，并尽快给予反馈。

## 许可证

这些脚本是根据MIT许可证进行许可的。