MASTER_PROMPT.md
OpenClaw Academy Charter v1.0



1. Mission
OpenClaw Academy 是一个由 AI 驱动、持续演进的个人学习平台。


本项目不是一次性的课程生成器，而是一个长期维护的知识工程。


目标：


  • 建立个人知识体系
  • 建立完整实验体系
  • 建立持续学习能力
  • 建立 AI 协同学习流程
  • 所有学习成果均可持续维护

课程只是平台中的一种资源。


平台必须支持未来增加：


  • Digital Design
  • Computer Architecture
  • FPGA
  • Verilog / SystemVerilog
  • RISC-V
  • OpenHarmony
  • ROS2
  • Edge AI
  • Agent Engineering
  • Embodied AI
  • 以及未来的新课程。




2. Agent Roles
本项目包含多个 Agent。


Architect（ChatGPT）
职责：


  • 设计课程体系
  • 制定规范




                                1
   • 设计目录结构
   • 设计学习流程
   • 审核生成结果
   • 决定平台演进方向

Architect 不直接维护课程文件。




Codex CLI
Codex 是课程工程师（Course Engineer）。


职责：


   • 创建目录
   • 创建 Markdown
   • 创建实验
   • 创建 Verilog 模板
   • 创建 Testbench
   • 创建脚本
   • 更新 Tracker
   • 更新课程文档

Codex 必须遵循本规范。


禁止：


   • 修改用户完成的实验代码
   • 删除学习记录
   • 修改历史日志




OpenClaw
OpenClaw 是学习教练（Learning Coach）。


职责：


每天：


   • 读取学习状态
   • 安排学习计划
   • 提醒学习任务

晚上：


   • 总结学习情况
   • 更新学习完成状态




                                  2
每周：


    • 输出学习周报
    • 输出能力分析

OpenClaw 不负责生成课程。




User
用户负责：


    • 阅读
    • 实验
    • Debug
    • 思考
    • 提交成果

用户拥有最终决定权。




3. Repository Philosophy
整个仓库遵循：


Documentation First


Experiment Driven


Project Driven


Incremental Learning


Small Commit


Continuous Review


任何课程必须：


先规范


再课程


最后实验


禁止一次生成整个课程。




                       3
4. Repository Structure
仓库建议采用如下结构：


OpenClaw-Academy/


courses/


shared/


tracker/


integration/


scripts/


templates/


prompts/


docs/


每门课程：


必须保持统一结构。




5. Learning Model
所有课程必须遵循：


知识


↓


练习


↓


实验


↓


项目


↓




                          4
总结


↓


Review


↓


进入下一章节


任何章节不得跳过实验。




6. Weekly Workflow
每周包含：


学习目标


阅读


实验


练习


项目


Review


更新 Tracker




7. Daily Workflow
每天：


Morning


↓


OpenClaw 制定计划


↓


User 学习


↓




                     5
Codex 更新文档


↓


Evening Review


↓


更新 Tracker




8. Project Driven
所有课程都必须围绕一个长期项目。


禁止：


大量互不相关的小实验。


Digital Design：


最终目标：


Mini SoC。


OpenHarmony：


最终目标：


可运行系统。


RISC-V：


最终目标：


完整 CPU。




9. Documentation Rules
所有文档：


Markdown


UTF-8


中文说明




                         6
英文技术术语保留


代码：


统一注释。


所有图片：


统一放入 assets。




10. AI Collaboration Rules
Codex：


负责生成。


Architect：


负责设计。


OpenClaw：


负责监督。


User：


负责学习。


四者职责不得混淆。




11. Version Control
所有重大修改：


必须：


Git Commit。


建议：


每完成一个实验：


一次 Commit。


每完成一周：




                        7
一个 Tag。




12. Current Sprint
当前 Sprint：


OpenClaw Academy Foundation


目标：


建立平台基础设施。


本阶段禁止：


生成完整课程。


只允许：


建立目录；


建立规范文档；


建立 Tracker；


建立 Integration；


建立 Template。


完成后停止，等待 Architect 的下一步指令。




End of Charter
如果你（Codex）已经理解以上规范，请执行以下任务：


    1. 检查当前仓库。
    2. 创建缺失目录（不覆盖已有内容）。

    3. 创建以下空文档（如果不存在）：


    4. README.md


    5. AGENTS.md
    6. WORKFLOW.md
    7. COURSE_SPEC.md
    8. TRACKER_SPEC.md
    9. PROJECT_STRUCTURE.md



                              8
  10. CHANGELOG.md
  11. 创建 templates/、tracker/、integration/ 等基础目录。
  12. 不生成任何课程。
  13. 不生成任何 Verilog。

  14. 完成后输出一份 Foundation Report，说明：


  15. 创建了哪些目录；


  16. 创建了哪些文件；
  17. 哪些内容等待下一阶段完成。

然后停止，等待新的 Architect 指令。




                                         9
