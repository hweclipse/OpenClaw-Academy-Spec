# 第 8 章：数字系统模块

> DDCA Chapter 5: Digital Building Blocks

## 本章目标

- 掌握计数器（二进制、BCD、LFSR）的设计
- 理解移位寄存器的多种工作模式（SIPO/SISO/PISO/PIPO）
- 设计参数化 FIFO
- 理解时钟分频器的设计

## 实验

| 编号 | 实验 | 说明 |
|------|------|------|
| E01 | 通用计数器 | 设计支持 up/down/load/enable 的可逆计数器 |
| E02 | 移位寄存器 | 设计支持 4 种模式的通用移位寄存器 |
| E03 | 同步 FIFO | 设计参数化深度的同步 FIFO |

## 与项目的关系

扩展 M2 的计数器为通用版本。FIFO 作为第 9 章 UART 的发送/接收缓冲。时钟分频器用于 Mini SoC 的时钟生成。
