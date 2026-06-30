// ============================================
// OpenClaw Academy
// Course     : Digital Design
// Chapter    : 01-from-zero-to-one
// Experiment : E01 — 门电路行为仿真
// ============================================
// Description:
//   驱动 6 种基本逻辑门（NOT/AND/OR/NAND/NOR/XOR），
//   遍历所有输入组合，验证真值表。
//
// Usage:
//   iverilog -o tb_gates_e01_sim tb_gates_e01.v
//   vvp tb_gates_e01_sim
//   gtkwave tb_gates_e01_wave.vcd
// ============================================

`timescale 1ns / 1ps

module tb_gates_e01;

    // ============================================
    // 信号声明
    // ============================================
    reg  a;       // 输入 A
    reg  b;       // 输入 B
    wire y_not;   // NOT A
    wire y_and;   // A AND B
    wire y_or;    // A OR B
    wire y_nand;  // A NAND B
    wire y_nor;   // A NOR B
    wire y_xor;   // A XOR B

    // ============================================
    // DUT: 6 种基本逻辑门
    // ============================================
    not  u_not  (y_not,  a);
    and  u_and  (y_and,  a, b);
    or   u_or   (y_or,   a, b);
    nand u_nand (y_nand, a, b);
    nor  u_nor  (y_nor,  a, b);
    xor  u_xor  (y_xor,  a, b);

    // ============================================
    // 波形输出
    // ============================================
    initial begin
        $dumpfile("tb_gates_e01_wave.vcd");
        $dumpvars(0, tb_gates_e01);
    end

    // ============================================
    // 初始化
    // ============================================
    initial begin
        a = 1'b0;
        b = 1'b0;
    end

    // ============================================
    // === BEGIN USER CODE ===
    // 在此处编写激励，遍历所有 (a,b) 输入组合。
    //
    // 要求：
    //   1. 依次测试 (a,b) = (0,0), (0,1), (1,0), (1,1)
    //   2. 每种组合保持至少 20ns
    //   3. 使用 $monitor 在终端输出当前值
    //   4. 最后用 $finish 结束仿真
    //
    // 提示：
    //   #10 表示等待 10 个时间单位（本文件中 1 单位 = 1ns）
    //   $monitor("time=%0t a=%b b=%b | NOT=%b AND=%b OR=%b NAND=%b NOR=%b XOR=%b",
    //           $time, a, b, y_not, y_and, y_or, y_nand, y_nor, y_xor);
    // ============================================

    // TODO: 在此处编写你的激励代码

    // === END USER CODE ===
    // ============================================

endmodule
