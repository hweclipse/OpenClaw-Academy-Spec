# 参考书单与资源

## 主教材

| 教材 | 作者 | 版本 | 覆盖课程 |
|------|------|------|----------|
| *Digital Design and Computer Architecture* | Harris & Harris | ARM® Edition 或 RISC-V Edition | Digital Design, Computer Architecture |

## 补充阅读

### Verilog / SystemVerilog

| 资源 | 作者 | 说明 |
|------|------|------|
| *Verilog HDL* (2nd Edition) | Samir Palnitkar | Verilog 经典入门 |
| *SystemVerilog for Design* | Stuart Sutherland | SV 设计子集 |
| [Sunburst Design Papers](http://www.sunburst-design.com/papers/) | Clifford E. Cummings | Verilog 编码风格必读 |

### 计算机体系结构

| 资源 | 作者 | 说明 |
|------|------|------|
| *Computer Organization and Design* | Patterson & Hennessy | RISC-V Edition — 第二门课程参考 |
| *Computer Architecture: A Quantitative Approach* | Hennessy & Patterson | 进阶参考 |

### 开源工具

| 资源 | 说明 |
|------|------|
| [Icarus Verilog](http://iverilog.icarus.com/) | Verilog 仿真器 |
| [GTKWave](http://gtkwave.sourceforge.net/) | 波形查看器 |
| [Verilator](https://www.veripool.org/verilator/) | Verilog 到 C++ 的高速仿真器（后续课程使用） |
| [Yosys](https://yosyshq.net/yosys/) | 开源综合工具（后续课程使用） |

## 学习顺序建议

```
Digital Design (DDCA Ch1-5)
    ↓
Verilog/SystemVerilog (DDCA Ch4 + Sutherland)
    ↓
Computer Architecture (DDCA Ch6-8)
    ↓
RISC-V (Patterson & Hennessy)
    ↓
FPGA (厂商文档 + 实战)
```
