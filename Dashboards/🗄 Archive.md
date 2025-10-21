# 🗄 Archive — Completed & Closed Items

Items that are done, cancelled, abandoned, archived, or hidden.

---

## Recently Completed

```dataview
TABLE type, area, completed_date as "Completed"
FROM ""
WHERE status = "Done"
SORT completed_date DESC
LIMIT 30
```

---

## Cancelled/Abandoned

```dataview
TABLE type, area, priority, modified as "Closed"
FROM ""
WHERE status = "Cancelled" OR status = "Abandoned"
SORT modified DESC
LIMIT 20
```

---

## Hidden Items

```dataview
TABLE type, area, visibility
FROM ""
WHERE visibility = "Hidden"
SORT modified DESC
```

---

## Archived Projects

```dataview
TABLE area, status, modified as "Archived"
FROM ""
WHERE status = "Archived" AND type = "Project"
SORT modified DESC
```

---

## Archive Stats

```dataview
TABLE WITHOUT ID
  status as "Status",
  length(rows) as "Count"
FROM ""
WHERE status != "Active" AND status != "Ongoing"
GROUP BY status
```

---

## Completion Rate (This Week)

```dataview
TABLE WITHOUT ID
  length(filter(rows, (r) => r.status = "Done" AND r.completed_date >= date(today) - dur(7 days))) as "Completed",
  length(filter(rows, (r) => r.status = "Active")) as "Active",
  round(length(filter(rows, (r) => r.status = "Done" AND r.completed_date >= date(today) - dur(7 days))) / (length(filter(rows, (r) => r.status = "Done" AND r.completed_date >= date(today) - dur(7 days))) + length(filter(rows, (r) => r.status = "Active"))) * 100, 1) + "%" as "Completion Rate"
FROM ""
WHERE type = "Task"
GROUP BY "This Week"
```

---

**Tip**: Review cancelled/abandoned items quarterly. Were they worth starting?

---

Last updated: 2025-10-18
