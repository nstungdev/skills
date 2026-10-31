# Hooks

Claude Code hooks that run shell commands at fixed points in a session. Each hook lives in its own folder with its script, a `settings.json` snippet, and a `README.md` that explains how to set it up.

| Hook | Event | Platform | What it does |
|---|---|---|---|
| [log-skill](log-skill/README.md) | `PreToolUse` on `Skill` | Windows (PowerShell) | Logs every skill invocation to `.claude/skill-log.jsonl` and shows `🧩 Skill triggered: <name>` on screen. Useful for checking which skills Claude picks and when. |
