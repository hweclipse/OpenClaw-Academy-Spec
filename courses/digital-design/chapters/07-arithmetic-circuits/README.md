# 第 7 章：算术电路

> DDCA Chapter 5: Digital Building Blocks — Arithmetic Circuits

## 本章目标

- 理解半加器、全加器的门级实现
- 掌握行波进位加法器（RCA）和超前进位加法器（CLA）
- 理解减法器（二进制补码）的实现
- 设计多功能 ALU
- 理解移位器（逻辑移位、算术移位、循环移位）

## 实验

| 编号 | 实验 | 说明 |
|------|------|------|
| E01 | 行波进位加法器 | 设计 4 位 RCA，并分析进位链延迟 |
| E02 | 超前进位加法器 | 设计 4 位 CLA，对比 RCA 的时序 |
| E03 | ALU 设计与验证 | 设计支持 ADD/SUB/AND/OR/XOR/SLT/SLL/SRL 的 8 位 ALU |

## 与项目的关系

**M3: ALU** — 完整的 8 位 ALU，支持 8 种运算，带有 Zero/Overflow/Carry 标志位。这是 Mini SoC 的数据通路核心。
