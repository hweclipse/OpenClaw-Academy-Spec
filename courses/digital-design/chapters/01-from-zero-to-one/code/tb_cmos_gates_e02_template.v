// ============================================
// OpenClaw Academy
// Course     : Digital Design
// Chapter    : 01-from-zero-to-one
// Experiment : E02 — CMOS 门验证
// ============================================
// Description:
//   用 Verilog 门级原语验证 CMOS NAND 和 NOR 门的真值表，
//   并与手工分析的 CMOS 晶体管导通状态对比。
//
// Usage:
//   iverilog -o tb_cmos_sim tb_cmos_gates_e02.v
//   vvp tb_cmos_sim
// ============================================

`timescale 1ns / 1ps

module tb_cmos_gates_e02;

    // ============================================
    // 信号声明
    // ============================================
    reg  a;         // 输入 A
    reg  b;         // 输入 B
    wire y_nand;    // NAND 输出
    wire y_nor;     // NOR 输出
    wire y_and;     // AND = NAND + NOT（观察多用多少晶体管）
    wire y_or;      // OR  = NOR  + NOT（观察多用多少晶体管）

    // ============================================
    // DUT
    // ============================================
    // CMOS NAND: 4 个晶体管
    nand u_nand (y_nand, a, b);

    // CMOS NOR: 4 个晶体管
    nor  u_nor  (y_nor,  a, b);

    // CMOS AND: NAND + NOT = 4 + 2 = 6 个晶体管
    // 这就是为什么 NAND 在 CMOS 中更"原生"
    nand u_nand_tmp (y_nand_tmp, a, b);
    not  u_not_and  (y_and, y_nand_tmp);

    // CMOS OR: NOR + NOT = 4 + 2 = 6 个晶体管
    nor  u_nor_tmp  (y_nor_tmp,  a, b);
    not  u_not_or   (y_or,  y_nor_tmp);

    // ============================================
    // 波形输出
    // ============================================
    initial begin
        $dumpfile("tb_cmos_gates_e02_wave.vcd");
        $dumpvars(0, tb_cmos_gates_e02);
    end

    // ============================================
    // === BEGIN USER CODE ===
    // 在此处编写激励和验证逻辑。
    //
    // 要求：
    //   1. 遍历所有 (a,b) 输入组合
    //   2. 用 $display 输出每个门的结果
    //   3. 对比 NAND vs AND 的输出关系
    //   4. 对比 NOR vs OR 的输出关系
    //   5. 添加自验证：如果输出与预期不符，用 $error 报告
    //
    // 提示：
    //   自验证模板：
    //     if (y_nand !== expected_nand)
    //       $error("FAIL: a=%b b=%b, NAND expected %b, got %b",
    //              a, b, expected_nand, y_nand);
    //   全部通过后打印 "ALL TESTS PASSED"
    // ============================================

    // TODO: 在此处编写你的激励和验证代码

    // === END USER CODE ===
    // ============================================

    // 内部信号（AND/OR 的中间输出）
    wire y_nand_tmp;
    wire y_nor_tmp;

endmodule
