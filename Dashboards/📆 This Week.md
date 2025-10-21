# 📆 This Week — Weekly Overview

---

## This Week's Tasks

```dataview
TABLE priority, area, time_bucket, energy, due_date
FROM ""
WHERE (time_bucket = "This Week" OR time_bucket = "Today")
  AND status = "Active"
  AND type = "Task"
SORT priority ASC, due_date ASC
```

---

## By Priority

### P1 Tasks
```dataview
TABLE area, energy, due_date
FROM ""
WHERE priority = [[P1]]
  AND (time_bucket = "This Week" OR time_bucket = "Today")
  AND status = "Active"
```

### P2 Tasks
```dataview
TABLE area, energy
FROM ""
WHERE priority = [[P2]]
  AND (time_bucket = "This Week" OR time_bucket = "Today")
  AND status = "Active"
```

---

## Due This Week

```dataview
TABLE priority, area, due_date
FROM ""
WHERE due_date >= date(today)
  AND due_date <= date(today) + dur(7 days)
  AND status != "Done"
  AND status != "Cancelled"
SORT due_date ASC, priority ASC
```

---

## Energy Planning

### High Energy Tasks
```dataview
LIST
FROM ""
WHERE energy = "High"
  AND (time_bucket = "This Week" OR time_bucket = "Today")
  AND status = "Active"
```

### Quick Wins (Low Energy)
```dataview
LIST
FROM ""
WHERE energy = "Low"
  AND (time_bucket = "This Week" OR time_bucket = "Today")
  AND status = "Active"
```

---

Last updated: 2025-10-18
