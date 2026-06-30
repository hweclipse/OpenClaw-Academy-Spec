# 术语表

> OpenClaw Academy 统一术语表。所有课程文档中的术语翻译以本表为准。

---

## 数字设计 (Digital Design)

| English | 中文 | 说明 |
|---------|------|------|
| Combinational Logic | 组合逻辑 | 输出仅依赖当前输入 |
| Sequential Logic | 时序逻辑 | 输出依赖当前输入和历史状态 |
| Latch | 锁存器 | 电平敏感的存储元件 |
| Flip-Flop | 触发器 | 边沿触发的存储元件 |
| Finite State Machine (FSM) | 有限状态机 | 用状态和转移描述时序行为 |
| Moore Machine | Moore 状态机 | 输出仅依赖于状态 |
| Mealy Machine | Mealy 状态机 | 输出依赖于状态和输入 |
| Propagation Delay | 传播延迟 | 输入变化到输出稳定的时间 |
| Setup Time | 建立时间 | 时钟边沿前数据须稳定的最小时间 |
| Hold Time | 保持时间 | 时钟边沿后数据须稳定的最小时间 |
| Critical Path | 关键路径 | 电路中延迟最长的路径 |
| Fan-out | 扇出 | 一个门输出驱动的门输入数量 |
| Ripple Carry Adder (RCA) | 行波进位加法器 | 进位逐位传播 |
| Carry-Lookahead Adder (CLA) | 超前进位加法器 | 并行计算进位 |
| ALU | 算术逻辑单元 | Arithmetic Logic Unit |
| Multiplexer (MUX) | 多路选择器 | 多输入选一输出 |
| Decoder | 译码器 | N 输入 → 2^N 输出 |
| Encoder | 编码器 | 2^N 输入 → N 输出 |
| Priority Encoder | 优先级编码器 | 最高优先级有效输入编码 |
| Register File | 寄存器堆 | 一组可通过地址访问的寄存器 |
| FIFO | 先入先出队列 | First-In First-Out |
| UART | 通用异步收发器 | Universal Asynchronous Receiver/Transmitter |

## Verilog

| English | 中文 | 说明 |
|---------|------|------|
| Module | 模块 | Verilog 基本设计单元 |
| Port | 端口 | 模块的输入输出接口 |
| Wire | 线网 | 组合逻辑连接，不存储值 |
| Reg | 寄存器 | 过程赋值目标，在 always 块内赋值 |
| Blocking Assignment | 阻塞赋值 | `=` — 顺序执行，用于组合逻辑 |
| Non-blocking Assignment | 非阻塞赋值 | `<=` — 并行执行，用于时序逻辑 |
| Testbench | 测试平台 | 用于验证设计的仿真环境 |
| Timescale | 时间精度 | 定义仿真时间单位和精度 |
| Synthesis | 综合 | 将 RTL 转换为门级网表 |
| RTL | 寄存器传输级 | Register Transfer Level |
