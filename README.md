# HarmonySU

鸿蒙模拟器 root 工具，方便调试。

## 使用方法

1. 编译 su

```bash
# 指定鸿蒙 NDK 路径
export HARMONY_NDK_HOME=/path/to/your/harmony-ndk/native

# 编译
./build.sh

# 查看编译结果
ls -l build/*/su
```

2. Patch 系统镜像

```bash
sudo ./patch_system_img.sh /path/to/your/system.img build/arm64-v8a/su
```

> [!NOTE]
> 脚本目前仅支持 Linux 环境下运行
>
> `system.img` 位置：
> - `~/Library/Huawei/Sdk/hmscore/{版本号}/system-image/phone_arm/system.img`
> - `~/Library/Huawei/Sdk/system-image/{版本号}/phone_arm/system.img`

3. 启动模拟器，切换 root 用户

```bash
# 启动 hdc shell
hdc shell

# 切换到 root 用户
su

# 这下就可以为所欲为了 😄
whomai
```
