# 📥 Inbox — Unprocessed Items

Items that need classification. These are missing Priority, Area, or Time Bucket.

---

## Quick Actions

- **Process Manually**: Add missing properties to each item
- **Batch Process**: Use `./AI/prepare_inbox_batch.sh` → Claude Code → `./AI/apply_ai_results.py`
- **Delete**: If not worth keeping

---

## Unprocessed Items

```dataview
TABLE type, file.ctime as "Created"
FROM ""
WHERE (priority = null OR area = null OR time_bucket = null OR time_bucket = "")
  AND type != null
  AND status = "Active"
  AND file.name != "Master List"
SORT file.ctime DESC
```

**Target:** Keep inbox at zero daily

---

## Processing Tips

### For Tasks:
1. What area of life? → Set `area`
2. How important/urgent? → Set `priority`
3. When to do it? → Set `time_bucket`
4. How long will it take? → Set `energy`

### For Notes/Ideas:
1. What area? → Set `area`
2. Add relevant tags
3. Set `time_bucket` to "Someday" if not actionable now

### For Bookmarks:
1. Run `bookmark_capture.py` to extract title/favicon
2. Set `area` based on content
3. Add domain-based tags from `domain_tag_mapping.json`

---

## Inbox Count

```dataview
TABLE rows.file.link AS "Items"
FROM ""
WHERE (priority = null OR area = null OR time_bucket = null OR time_bucket = "")
  AND type != null
  AND status = "Active"
  AND file.name != "Master List"
GROUP BY type
```

---

Last updated: 2025-10-18
