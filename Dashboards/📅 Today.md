# 📅 Today — Tasks for Today

Focus on what matters today.

---

## Today's Priority Tasks

### P1 — Urgent & Important
```dataview
TASK
FROM ""
WHERE priority = [[P1]]
  AND time_bucket = "Today"
  AND status = "Active"
```

### P2 — Important
```dataview
TASK
FROM ""
WHERE priority = [[P2]]
  AND time_bucket = "Today"
  AND status = "Active"
```

---

## All Today Tasks by Area

```dataview
TABLE priority, energy, area
FROM ""
WHERE time_bucket = "Today"
  AND status = "Active"
  AND type = "Task"
SORT priority ASC
```

---

## Due Today

```dataview
TABLE priority, area, due_date
FROM ""
WHERE due_date = date(today)
  AND status != "Done"
  AND status != "Cancelled"
SORT priority ASC
```

---

## Quick Stats

```dataview
TABLE WITHOUT ID
  length(filter(rows, (r) => r.status = "Active")) as "Active",
  length(filter(rows, (r) => r.status = "Done")) as "Done",
  length(filter(rows, (r) => r.priority = [[P1]])) as "P1",
  length(filter(rows, (r) => r.priority = [[P2]])) as "P2"
FROM ""
WHERE time_bucket = "Today"
GROUP BY "Today"
```

---

**🎯 Focus**: Complete P1 tasks first, then P2.

---

Last updated: 2025-10-18
