# 🎯 Priority Board — Eisenhower Matrix View

All active tasks organized by priority level.

---

## P1 — Urgent & Important (Do First)

```dataview
TABLE area, time_bucket, due_date, energy
FROM ""
WHERE priority = [[P1]]
  AND status = "Active"
  AND type = "Task"
SORT due_date ASC
```

---

## P2 — Important but Not Urgent (Schedule)

```dataview
TABLE area, time_bucket, energy
FROM ""
WHERE priority = [[P2]]
  AND status = "Active"
  AND type = "Task"
SORT area ASC
```

---

## P3 — Urgent but Not Important (Delegate/Minimize)

```dataview
TABLE area, time_bucket
FROM ""
WHERE priority = [[P3]]
  AND status = "Active"
  AND type = "Task"
```

---

## P4 — Neither Urgent nor Important (Consider Deleting)

```dataview
TABLE area, time_bucket
FROM ""
WHERE priority = [[P4]]
  AND status = "Active"
  AND type = "Task"
```

**Tip**: Regularly review P4 tasks. Many should be deleted, not done.

---

## Priority Distribution

```dataview
TABLE WITHOUT ID
  priority as "Priority",
  length(rows) as "Count"
FROM ""
WHERE type = "Task" AND status = "Active"
GROUP BY priority
SORT priority ASC
```

---

Last updated: 2025-10-18
