# 第 9 章：RTL 设计方法

> DDCA Chapter 4 & Chapter 5: RTL Design

## 本章目标

- 理解数据通路 + 控制器的划分方法
- 掌握行为级建模（`always @(*)`, `always @(posedge clk)`）
- 理解阻塞赋值 vs 非阻塞赋值的正确使用场景
- 掌握自验证 Testbench 的编写方法（task/function/$monitor）
- 了解综合（synthesis）的基本概念和约束

## 实验

| 编号 | 实验 | 说明 |
|------|------|------|
| E01 | UART TX 控制器 | 用 FSM 设计一个简单的 UART 发送器（8N1） |
| E02 | 自验证 Testbench | 为 UART TX 编写完整的自验证 Testbench |
| E03 | 数据通路+控制器 | 设计一个简单的外设寄存器读写模块 |

## 与项目的关系

**M4: 外设控制器** — UART TX 模块。这是 Mini SoC 的 I/O 接口，也是第一次将 FSM + 数据通路 + 时序约束整合在一起的设计。
