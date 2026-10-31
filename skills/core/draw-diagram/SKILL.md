---
name: draw-diagram
description: Draw content as a Mermaid diagram, choosing the diagram type that fits the content. Use when the user asks for a diagram, flow, chart of a process, architecture view, or data model, or when structure is easier to see than to read.
---

# Draw Diagram

1. Choose the type by content:
   - Steps or decisions: `flowchart`
   - Messages between actors over time: `sequenceDiagram`
   - States and transitions: `stateDiagram-v2`
   - Data entities and their relations: `erDiagram`
   - Systems and their dependencies: `flowchart` with `subgraph`
   - Events over time: `timeline`
2. Use at most 15 nodes per diagram. If more are needed, split them into diagrams of 15 nodes or fewer.
3. Keep node labels to 5 words or fewer. Put labels with special characters in double quotes.

Output, in the user's language: for each diagram, one sentence saying what it shows, then one `mermaid` code block.
