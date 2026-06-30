// ============================================
// OpenClaw Academy
// Template   : Testbench Skeleton
// Version    : 1.0
// ============================================
// Description:
//   {{一句话描述本 Testbench 的测试目标}}
//
// Usage:
//   iverilog -o tb_{{dut_name}}_sim tb_{{dut_name}}.v {{dut_name}}.v
//   vvp tb_{{dut_name}}_sim
//
// Test Cases:
//   TC01 - {{test_case_1_description}}
//   TC02 - {{test_case_2_description}}
// ============================================

`timescale 1ns / 1ps

module tb_{{dut_name}};

    // ============================================
    // 信号声明
    // ============================================
    reg             clk;
    reg             rst_n;

    // DUT 输入
    // reg ...       {{input_signal}};

    // DUT 输出
    // wire ...      {{output_signal}};

    // ============================================
    // DUT 实例化
    // ============================================
    // {{dut_name}} #(
    //     .PARAM_NAME(VALUE)
    // ) u_dut (
    //     .clk   (clk),
    //     .rst_n (rst_n),
    //     ...
    // );

    // ============================================
    // 时钟生成
    // ============================================
    // TODO: 定义时钟周期
    // parameter CLK_PERIOD = 10; // 100MHz
    //
    // always #(CLK_PERIOD/2) clk = ~clk;

    // ============================================
    // 复位生成
    // ============================================
    // initial begin
    //     rst_n = 1'b0;
    //     #(CLK_PERIOD * 5) rst_n = 1'b1;
    // end

    // ============================================
    // 初始化
    // ============================================
    // initial begin
    //     clk = 1'b0;
    //     // 初始化输入信号
    // end

    // ============================================
    // 测试用例
    // ============================================
    // initial begin
    //     // 等待复位释放
    //     @(posedge rst_n);
    //     repeat(2) @(posedge clk);
    //
    //     // === TC01: {{test_case_1_name}} ===
    //     $display("[TC01] Starting: {{test_case_1_name}}");
    //     // ... 激励 ...
    //     // ... 检查 ...
    //     $display("[TC01] PASSED");
    //
    //     // === TC02: {{test_case_2_name}} ===
    //     // ...
    //
    //     $display("=== All tests passed ===");
    //     $finish;
    // end

    // ============================================
    // 波形输出（可选，用于 GTKWave 调试）
    // ============================================
    // initial begin
    //     $dumpfile("tb_{{dut_name}}_wave.vcd");
    //     $dumpvars(0, tb_{{dut_name}});
    // end

endmodule
