# log-skill

Logs every skill invocation in a project and shows it on screen.

Before Claude runs the `Skill` tool, the hook:

1. Appends one JSON line to `.claude/skill-log.jsonl` with the time, the skill input, and the session id.
2. Shows a message in the session: `🧩 Skill triggered: <skill-name>`.

The hook never blocks the skill: it always exits with code `0`.

## Requirements

- Windows with Windows PowerShell (`powershell.exe`).
- Claude Code with hooks enabled.

## Files

| File | Purpose |
|---|---|
| `log-skill.ps1` | The script the hook runs. Reads the hook's JSON from stdin, writes the log, prints the on-screen message. |
| `settings.json` | The `hooks` block to merge into your project settings. |

## Setup

Run these steps in the project where you want the logging.

### 1. Copy the script

Copy `log-skill.ps1` to `.claude/hooks/log-skill.ps1` in your project:

```powershell
New-Item -ItemType Directory -Force .claude\hooks
Copy-Item <path-to-this-repo>\hooks\log-skill\log-skill.ps1 .claude\hooks\
```

### 2. Add the hook to your project settings

Claude Code reads hooks from `.claude/settings.json` (shared with the team) or `.claude/settings.local.json` (only on your machine). Use `settings.local.json` so the logging stays personal.

Merge the `hooks` block from `settings.json` into that file. Copy only `hooks`, not the `// ...` note keys at the top:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Skill",
        "hooks": [
          {
            "type": "command",
            "shell": "powershell",
            "command": "powershell -NoProfile -ExecutionPolicy Bypass -File \"$env:CLAUDE_PROJECT_DIR\\.claude\\hooks\\log-skill.ps1\""
          }
        ]
      }
    ]
  }
}
```

If the file already has a `hooks.PreToolUse` array, add the object above to that array instead of replacing it.

### 3. Keep the local files out of git

Add these lines to the project's `.gitignore`:

```gitignore
.claude/settings.local.json
.claude/hooks/log-skill.ps1
.claude/skill-log.jsonl
```

### 4. Reload and check

Start a new Claude Code session in the project, or review hooks with `/hooks` in an open session. Then run any skill, for example `/nstung-core:ask-user`. You should see:

```
🧩 Skill triggered: nstung-core:ask-user
```

and a new line in `.claude/skill-log.jsonl`:

```json
{"time":"2026-10-31T20:15:02","skill":{"skill":"nstung-core:ask-user"},"session":"<session-id>"}
```

## Troubleshooting

| Symptom | Check |
|---|---|
| No message, no log line | The hook is in `.claude/settings.json` or `.claude/settings.local.json`, not in `.claude/hooks/settings.json`. Restart the session after editing settings. |
| Hook error about the script path | The script is at `.claude/hooks/log-skill.ps1` under the project root that `CLAUDE_PROJECT_DIR` points to. |
| Garbled characters in the log | The script writes UTF-8 without BOM. Open the log with an editor set to UTF-8. |
