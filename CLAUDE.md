# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

OpenClaw Academy is an AI-driven, continuously evolving personal learning platform. This is not a one-time course generator — it is a long-term knowledge engineering project. The repo serves as both the specification hub (charters, specs, trackers) and the content store (courses, experiments, templates).

**Current Sprint: Foundation** — building platform infrastructure only. Generating complete courses is **forbidden** at this stage. Only directory scaffolding, specification documents, tracker setup, integration setup, and template creation are allowed. Once complete, stop and wait for Architect instruction.

## Agent Roles

Three AI agents collaborate with the User. Roles must NOT be confused:

| Agent | Role | Responsibilities | Constraints |
|-------|------|-----------------|-------------|
| **Architect** (ChatGPT) | Curriculum Designer | Design curriculum structure, write specifications, review generated output, decide platform evolution direction | Does NOT directly maintain course files |
| **Codex** (Claude Code) | Course Engineer | Create directories, write Markdown, create experiments, Verilog templates, testbenches, scripts, update trackers and course docs | Must follow this spec; must NOT modify user-completed experiment code, delete learning records, or modify history logs |
| **OpenClaw** | Learning Coach | Daily: read learning status, plan study schedule, remind of tasks. Evening: summarize learning, update completion status. Weekly: output learning report and capability analysis | Does NOT generate courses |
| **User** | Learner | Read, experiment, debug, think, submit results | Holds final decision authority |

## Philosophy & Principles

- **Documentation First** → Spec before course before experiment
- **Experiment Driven** — no chapter may skip experiments
- **Project Driven** — every course centers on a long-term project (e.g., Digital Design → Mini SoC; RISC-V → complete CPU). Isolated small experiments are forbidden.
- **Incremental Learning** — knowledge → practice → experiment → project → summary → review → next chapter
- **Small Commits** — one commit per completed experiment; one tag per completed week
- **Continuous Review** — never generate an entire course at once

## Documentation Conventions

- All docs in **Markdown**, **UTF-8**
- Primary language: **Chinese** for explanations; **English** retained for technical terms
- Code: uniform commenting style
- All images under `assets/` directories

## Planned Repository Structure

```
OpenClaw-Academy/
├── courses/         # Course content (future)
├── shared/          # Shared resources
├── tracker/         # Learning progress tracking
├── integration/     # Cross-course integration
├── scripts/         # Automation scripts
├── templates/       # Course/experiment templates
├── prompts/         # Reusable AI prompts
└── docs/            # Platform-level documentation
```

Each course follows a uniform internal structure (defined in COURSE_SPEC.md).

## Key Specification Files

- `MASTER_PROMPT.md` — the project charter (read-only reference)
- `AGENTS.md` — agent role definitions (to be created)
- `WORKFLOW.md` — daily/weekly workflow definitions (to be created)
- `COURSE_SPEC.md` — course structure specification (to be created)
- `TRACKER_SPEC.md` — learning tracker specification (to be created)
- `PROJECT_STRUCTURE.md` — directory structure specification (to be created)
- `CHANGELOG.md` — project changelog (to be created)
- `README.md` — project overview (to be created)

## Current Sprint Constraints

**Allowed:** Create directories, create specification docs, create tracker scaffolding, create integration scaffolding, create templates.

**Forbidden:** Generate complete courses, generate Verilog code, modify user-completed work, delete learning records.
