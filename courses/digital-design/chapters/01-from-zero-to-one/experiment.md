# 第 1 章：从零到一 — 实验

---

## 实验目标

通过两个实验建立对门电路行为和 CMOS 原理的第一手认知。E01 用 Verilog 仿真观察门的行为，E02 深入理解 CMOS 上拉/下拉网络。

## 前置条件

- 已完成 knowledge.md §1–3 的阅读
- 已安装 Icarus Verilog + GTKWave（运行 `bash shared/tools/setup-iverilog.sh`）

## 背景

本实验是你在 OpenClaw Academy 的**第一个实验**。我们不会一上来就写 RTL 代码，而是用 Verilog 的测试能力来观察门电路的行为——这让你先熟悉工具链，再逐步深入。

---

## 实验 E01：门电路行为仿真

### 任务描述

用 Verilog Testbench 驱动 6 种基本逻辑门（NOT/AND/OR/NAND/NOR/XOR），生成波形并用 GTKWave 查看，验证真值表。

### 步骤

**1. 创建 Testbench 文件 `code/tb_gates_e01.v`**

模板见 `code/tb_gates_e01_template.v`。你需要在 `=== BEGIN USER CODE ===` 区域中补全输入激励。

**2. 编译并仿真**

```bash
cd courses/digital-design/chapters/01-from-zero-to-one/code/
iverilog -o tb_gates_e01_sim tb_gates_e01.v
vvp tb_gates_e01_sim
```

**3. 用 GTKWave 查看波形**

```bash
gtkwave tb_gates_e01_wave.vcd
```

将波形中的 `a`, `b` 和 6 个输出 `y_not` 到 `y_xor` 添加到显示窗口。

**4. 验证真值表**

对着波形，检查每个门的输出是否与真值表一致。记录任何你注意到的现象（如毛刺 glitch，如果有的话）。

### 验收标准

- [ ] 编译通过（0 errors）
- [ ] 波形中能看到所有 4 种 (a,b) 输入组合（00, 01, 10, 11）
- [ ] 6 个门的输出均与知识文档中的真值表一致
- [ ] GTKWave 截图保存在 `code/` 目录

### 提示

- `$dumpfile` 和 `$dumpvars` 已经写在模板中，不要删除
- 激励应该覆盖所有 4 种输入组合，每种组合保持至少 20ns
- 用 `$monitor` 可以在终端看到实时输出，而不仅是波形

---

## 实验 E02：CMOS 门上拉/下拉网络分析

### 任务描述

这个实验不需要写代码——它是一次**纸笔分析 + 仿真验证**实验。针对 CMOS NAND 门和 CMOS NOR 门：

1. 画出晶体管级电路（参考 knowledge.md §5 的格式）
2. 标注出每种输入组合下哪些晶体管导通、哪些截止
3. 推导输出值
4. 用 Verilog 门级仿真验证你的推导

### 步骤

**1. 纸笔分析**

在笔记本上画出以下两个电路的晶体管图，并为每种输入组合标注导通/截止状态：

- CMOS NAND 门（2 输入）
- CMOS NOR 门（2 输入）

表格格式：

| A | B | NMOS_A | NMOS_B | PMOS_A | PMOS_B | PDN 导通？ | PUN 导通？ | Y |
|---|---|----------|----------|----------|----------|-------------|-------------|---|
| 0 | 0 | off | off | on | on | 否 | 是 | 1 |
| ... | ... | ... | ... | ... | ... | ... | ... | ... |

**2. Verilog 验证**

创建 `code/tb_cmos_gates_e02.v`，用 Verilog **门级原语**（`nand`, `nor`）实例化 CMOS 门，并验证真值表。

模板见 `code/tb_cmos_gates_e02_template.v`。

**3. 仿真验证**

```bash
iverilog -o tb_cmos_sim tb_cmos_gates_e02.v
vvp tb_cmos_sim
```

### 分析问题

在实验报告中回答以下问题：

1. 为什么 CMOS NAND 的 PDN（下拉网络）是串联的，而 PUN（上拉网络）是并联的？
2. 为什么 CMOS AND 门比 NAND 门多用 2 个晶体管？
3. 如果 CMOS NOR 门的 PMOS_A 损坏（永远截止），这个门还能正常工作吗？在什么输入组合下会出问题？

### 验收标准

- [ ] 完成 CMOS NAND 和 NOR 的晶体管级电路图
- [ ] 完成导通/截止状态分析表
- [ ] Verilog 仿真输出与手工分析一致
- [ ] 回答全部 3 个分析问题

---

## 实验产出

| 文件 | 说明 |
|------|------|
| `code/tb_gates_e01.v` | E01: 6 门行为仿真 Testbench（从模板补全） |
| `code/tb_gates_e01_wave.vcd` | E01: 仿真波形 |
| `code/e01_wave_screenshot.png` | E01: GTKWave 截图 |
| `code/tb_cmos_gates_e02.v` | E02: CMOS 门验证 Testbench |
| `code/e02_analysis.md` | E02: 分析问题答案 |

## 常见问题

**Q:** 为什么 `iverilog` 命令报 "command not found"？
**A:** 运行 `bash shared/tools/setup-iverilog.sh` 安装工具链。

**Q:** 仿真输出全是 `x` (unknown)？
**A:** 检查是否忘了初始化输入信号。在 `initial` 块中给所有输入赋初值。

**Q:** 波形中看到的过渡区是什么？
**A:** 那是信号的上升/下降时间。数字抽象忽略它——只要它稳定在噪声容限之内就行。这就是 knowledge.md §1 讲的 "过渡区"。
