# Wins — Achievements & Celebrations

Track and celebrate your progress, big and small.

---

## What is a Win?

Anything worth celebrating:
- Completed important tasks
- Milestones reached
- Breakthroughs achieved
- Good habits maintained
- Lessons learned
- Positive outcomes

**Why track wins?**
- Maintain motivation
- See progress over time
- Combat negativity bias
- Build confidence
- Reflect on growth

---

## Usage

Create a win note with frontmatter:

```yaml
---
type: "Win"
title: "Finished IWin setup"
celebrated_date: 2025-10-18
area: "[[Personal]]"
tags: [productivity, milestone]
---

# Finished IWin setup

Successfully built and configured the complete IWin system with Claude Code!

This took X hours but now I have a solid foundation for task management.
```

---

## Recent Wins

```dataview
TABLE celebrated_date, area, tags
FROM ""
WHERE type = "Win"
SORT celebrated_date DESC
LIMIT 20
```

---

## Wins This Week

```dataview
LIST
FROM ""
WHERE type = "Win" AND celebrated_date >= date(today) - dur(7 days)
SORT celebrated_date DESC
```

---

## Wins Dashboard

See [[🏆 Wins]] dashboard for the full wins view.

---

Last updated: 2025-10-18
