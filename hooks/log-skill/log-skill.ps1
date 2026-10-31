# IMPORTANT: Place this file in the .claude/hooks/log-skill.ps1 path of your project to enable skill logging.

# Log every skill invocation and show it on screen
$ErrorActionPreference = 'SilentlyContinue'
$utf8 = New-Object System.Text.UTF8Encoding($false)   # UTF-8 without BOM
[Console]::OutputEncoding = $utf8
[Console]::InputEncoding  = $utf8                     # stdin JSON is UTF-8, not the OEM code page

$data = [Console]::In.ReadToEnd() | ConvertFrom-Json
$ti = $data.tool_input

# Skill name from the tool input (falls back to the raw input)
$skill = if ($ti.skill) { $ti.skill } elseif ($ti.command) { $ti.command } else { $ti | ConvertTo-Json -Compress }

# 1. Keep the log file
$log = Join-Path $env:CLAUDE_PROJECT_DIR '.claude\skill-log.jsonl'
$entry = [ordered]@{ time = (Get-Date).ToString('s'); skill = $ti; session = $data.session_id } |
  ConvertTo-Json -Compress -Depth 5
[System.IO.File]::AppendAllText($log, $entry + "`n", $utf8)

# 2. Show it on screen
$icon = [char]::ConvertFromUtf32(0x1F9E9)
@{ systemMessage = "$icon Skill triggered: $skill" } | ConvertTo-Json -Compress
exit 0