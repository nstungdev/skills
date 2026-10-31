---
name: build-mental-model
description: Reduce a subject to its core parts and the relations between them, so the reader can reason about it on their own. Use when the user wants to understand how something works, such as a system, codebase, process, or concept.
---

# Build Mental Model

1. Name at most 5 core parts of the subject.
2. Write each relation between parts as `<part> -> <verb> -> <part>`.
3. Using only these parts and relations, predict one real behaviour of the subject.
   If the prediction is wrong, add or fix a part or relation, then predict again.

Output, in the user's language: Parts, Relations, and one line `Prediction check: <behaviour> - correct`.
