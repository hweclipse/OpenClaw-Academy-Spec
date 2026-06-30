// ============================================
// OpenClaw Academy
// Template   : Verilog Module Skeleton
// Version    : 1.0
// ============================================
// Module     : {{module_name}}
// Author     : User
// Course     : {{course_name}}
// Chapter    : {{chapter_slug}}
// Date       : {{YYYY-MM-DD}}
// Project    : {{project_name}}
// ============================================
// Description:
//   {{一句话描述模块功能}}
//
// Interface:
//   clk       - 时钟信号
//   rst_n     - 异步复位（低有效）
//   {{signal}} - {{description}}
//
// Parameters:
//   {{PARAM}} - {{description}}（默认 {{default_value}}）
//
// Timing:
//   {{关键时序约束}}
// ============================================

module {{module_name}} #(
    parameter {{PARAM}} = {{default_value}}
)(
    input  wire             clk,
    input  wire             rst_n,
    // 在此添加更多端口
    input  wire             {{input_signal}},
    output wire             {{output_signal}}
);

    // ============================================
    // 内部信号
    // ============================================
    // reg ... ;
    // wire ... ;

    // ============================================
    // === BEGIN USER CODE ===
    // 在此处实现你的设计
    // === END USER CODE ===
    // ============================================

endmodule
