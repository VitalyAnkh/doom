import subprocess
import os

# 定义 emacs 命令
cmd = 'emacs --batch --eval "(progn (require \'org) (setq org-confirm-babel-evaluate nil) (org-babel-tangle-file \\"~/.config/doom/config.org\\"))"'

# 执行 emacs 命令
process = subprocess.run(
    cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
)

# 检查命令是否执行成功
if process.returncode != 0:
    print("命令执行失败:")
    print(process.stderr.decode("utf-8"))
else:
    print("命令执行成功")

    # 构建 config.el 文件的路径
    config_file_path = os.path.expanduser("~/.config/doom/config.el")

    # 检查文件是否存在
    if not os.path.isfile(config_file_path):
        print("错误: 文件 {} 不存在".format(config_file_path))
    else:
        # 读取文件并检查是否包含 'package!'
        with open(config_file_path, "r", encoding="utf-8") as f:
            content = f.read()
            if "(unpin! citar)" in content:
                print('文件中包含 "(unpin! citar)"')
            else:
                print('文件中不包含 "(unpin! citar)"')
