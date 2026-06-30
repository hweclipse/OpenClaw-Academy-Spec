#!/bin/bash
# ============================================
# OpenClaw Academy — 工具链安装脚本
# 用于 Digital Design / Verilog 课程
# ============================================
# 用法: bash shared/tools/setup-iverilog.sh
# ============================================

set -e

echo "=== OpenClaw Academy 工具链安装 ==="
echo ""

# 检测系统包管理器
if command -v apt &> /dev/null; then
    PKG_MGR="apt"
elif command -v brew &> /dev/null; then
    PKG_MGR="brew"
elif command -v pacman &> /dev/null; then
    PKG_MGR="pacman"
else
    echo "[ERROR] 未检测到支持的包管理器。请手动安装 iverilog 和 GTKWave。"
    exit 1
fi

echo "[INFO] 检测到包管理器: $PKG_MGR"

# 安装 Icarus Verilog
echo ""
echo "[1/2] 安装 Icarus Verilog (iverilog)..."
case $PKG_MGR in
    apt)
        sudo apt install -y iverilog
        ;;
    brew)
        brew install icarus-verilog
        ;;
    pacman)
        sudo pacman -S --noconfirm iverilog
        ;;
esac

# 安装 GTKWave
echo ""
echo "[2/2] 安装 GTKWave..."
case $PKG_MGR in
    apt)
        sudo apt install -y gtkwave
        ;;
    brew)
        brew install gtkwave
        ;;
    pacman)
        sudo pacman -S --noconfirm gtkwave
        ;;
esac

# 验证安装
echo ""
echo "=== 验证安装 ==="
iverilog -V 2>&1 | head -1
echo ""
which gtkwave && echo "GTKWave: installed" || echo "[WARN] GTKWave 未找到"

echo ""
echo "=== 安装完成 ==="
echo "使用方法:"
echo "  编译: iverilog -o sim.out <source_files>"
echo "  运行: vvp sim.out"
echo "  波形: gtkwave wave.vcd"
