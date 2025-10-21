# 🏆 Wins — Celebrate Your Progress

Track and celebrate achievements, big and small.

---

## Recent Wins

```dataview
TABLE celebrated_date as "Date", area as "Area", tags as "Tags"
FROM ""
WHERE type = "Win"
SORT celebrated_date DESC
LIMIT 30
```

---

## This Week's Wins

```dataview
LIST
FROM ""
WHERE type = "Win"
  AND celebrated_date >= date(today) - dur(7 days)
SORT celebrated_date DESC
```

---

## By Area

### Work Wins
```dataview
LIST
FROM ""
WHERE type = "Win" AND area = [[Work]]
SORT celebrated_date DESC
LIMIT 10
```

### Personal Wins
```dataview
LIST
FROM ""
WHERE type = "Win" AND area = [[Personal]]
SORT celebrated_date DESC
LIMIT 10
```

### Learning Wins
```dataview
LIST
FROM ""
WHERE type = "Win" AND area = [[Learning]]
SORT celebrated_date DESC
LIMIT 10
```

### Health Wins
```dataview
LIST
FROM ""
WHERE type = "Win" AND area = [[Health]]
SORT celebrated_date DESC
LIMIT 10
```

---

## Win Stats

```dataview
TABLE WITHOUT ID
  area as "Area",
  length(rows) as "Total Wins"
FROM ""
WHERE type = "Win"
GROUP BY area
SORT length(rows) DESC
```

---

## Add a Win

Create a new note with:

```yaml
---
type: "Win"
title: "Your achievement"
celebrated_date: 2025-10-18
area: "[[Area]]"
tags: []
---
```

---

**Remember**: Celebrate progress, not just completion!

---

Last updated: 2025-10-18
