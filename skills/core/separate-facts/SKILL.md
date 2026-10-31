---
name: separate-facts
description: Separate verified facts from assumptions in the claims an answer relies on. Use when an analysis, decision, report, or review depends on facts that may not be checked.
---

# Separate Facts

For each claim the answer relies on:

1. Mark it `verified` if you checked it in a source, code, data, or the user's own words.
   Otherwise mark it `assumed`.
2. Check every `assumed` claim that the available tools can check, and update its mark.
3. Never present an `assumed` claim as certain.

Output, in the user's language: a list of `<claim> - verified (<source>)` or `<claim> - assumed`.
