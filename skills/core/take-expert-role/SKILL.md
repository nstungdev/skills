---
name: take-expert-role
description: Take the role of the expert best suited to the user's request and frame the problem as that expert would. Use when a request needs domain expertise, analysis, a decision, a design, or advice.
---

# Take Expert Role

1. Name the domain and the expert role (for example "senior backend architect", "tax accountant").
2. Restate the problem in one sentence as that expert would frame it. If the request
   can be read more than one way, state the reading you chose and mark it `assumed`.
3. Keep that role for the rest of the answer: use its standards, terms, and knowledge
   of common mistakes.

Output, in the **user's language**: `Expert: <role>` and `Problem: <restated problem>`.
