---
name: ask-user
description: Ask the user a question or a confirmation through the AskUserQuestion tool, one at a time, with the recommended option first. Use whenever Claude needs the user to choose, provide information, or approve an action.
---

# Ask User

Use the `AskUserQuestion` tool (`ask_user_input_v0` in Claude.ai) for every question
or confirmation. Do not write questions as plain text.

- Ask one question per call. Wait for the answer, then ask the next one.
- Give 2 to 4 options. Put the recommended option first and end its label with `(Recommended)`.
- For a confirmation, use the options `Yes, <action>` and `No, change it`.
- Write the question and options in the **user's language**.