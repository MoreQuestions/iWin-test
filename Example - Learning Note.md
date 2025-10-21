---
type: "Note"
title: "Learning Note - Obsidian Dataview Basics"
area: "[[Learning]]"
tags: [obsidian, dataview, notes, tutorial]
status: "Active"
visibility: "Active"
processed_by_ai: false
created: 2025-10-18
modified: 2025-10-18
---

# Learning Note - Obsidian Dataview Basics

Quick reference for Dataview query syntax in IWin.

## Basic Query Structure

```dataview
TABLE field1, field2, field3
FROM "folder" OR #tag
WHERE condition
SORT field ASC/DESC
LIMIT number
```

## Common Queries in IWin

### List all active tasks
```dataview
LIST
FROM ""
WHERE type = "Task" AND status = "Active"
```

### Table of tasks by priority
```dataview
TABLE priority, area, time_bucket
FROM ""
WHERE type = "Task" AND status = "Active"
SORT priority ASC
```

### Filter by area
```dataview
TABLE priority, time_bucket
FROM ""
WHERE area = [[Work]] AND status = "Active"
```

### Tasks due this week
```dataview
TABLE due_date, priority
FROM ""
WHERE due_date >= date(today) AND due_date <= date(today) + dur(7 days)
SORT due_date ASC
```

## Tips
- Dataview reads frontmatter properties automatically
- Use `FROM ""` to query entire vault
- Link syntax `[[Page]]` works in WHERE clauses
- Date functions: `date(today)`, `dur(7 days)`, etc.

## Related
- [[Master List]]
- All dashboards in `/Dashboards` use Dataview
- [Dataview Documentation](https://blacksmithgu.github.io/obsidian-dataview/)

## Notes
This is an example of a **Note** type item. Notes don't have priorities or time buckets like tasks do. They're for reference and knowledge capture.
