# 🗂 Area Kanban — Tasks by Life Domain

See tasks organized by Area and Time Bucket.

---

## Work

```dataview
TABLE time_bucket, priority, energy
FROM ""
WHERE area = [[Work]]
  AND status = "Active"
  AND type = "Task"
SORT priority ASC
```

## Personal

```dataview
TABLE time_bucket, priority, energy
FROM ""
WHERE area = [[Personal]]
  AND status = "Active"
  AND type = "Task"
SORT priority ASC
```

## Learning

```dataview
TABLE time_bucket, priority, energy
FROM ""
WHERE area = [[Learning]]
  AND status = "Active"
  AND type = "Task"
SORT priority ASC
```

## Health

```dataview
TABLE time_bucket, priority, energy
FROM ""
WHERE area = [[Health]]
  AND status = "Active"
  AND type = "Task"
SORT priority ASC
```

## Finance

```dataview
TABLE time_bucket, priority, energy
FROM ""
WHERE area = [[Finance]]
  AND status = "Active"
  AND type = "Task"
SORT priority ASC
```

## Social

```dataview
TABLE time_bucket, priority, energy
FROM ""
WHERE area = [[Social]]
  AND status = "Active"
  AND type = "Task"
SORT priority ASC
```

---

## Area Distribution

```dataview
TABLE WITHOUT ID
  area as "Area",
  length(rows) as "Active Tasks"
FROM ""
WHERE type = "Task" AND status = "Active"
GROUP BY area
SORT area ASC
```

---

**Tip**: Use Obsidian Kanban plugin for drag-and-drop board view.

---

Last updated: 2025-10-18
