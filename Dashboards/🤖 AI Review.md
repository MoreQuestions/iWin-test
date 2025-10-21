# 🤖 AI Review — Claude Code Classifications

Review items classified by Claude Code before fully accepting them.

---

## Recently Classified Items

```dataview
TABLE type, priority, area, time_bucket, modified as "Classified"
FROM ""
WHERE processed_by_ai = true
  AND status = "Active"
SORT modified DESC
LIMIT 50
```

---

## Pending Review

Items classified today that need verification:

```dataview
TABLE type, priority, area, time_bucket
FROM ""
WHERE processed_by_ai = true
  AND date(modified) = date(today)
  AND status = "Active"
```

---

## Review Checklist

For each item, verify:
- [ ] **Type** is correct (Task vs. Note vs. Idea vs. Bookmark)
- [ ] **Priority** makes sense (P1-P4)
- [ ] **Area** is appropriate
- [ ] **Time Bucket** is realistic
- [ ] **Tags** are relevant
- [ ] **Energy** level is accurate (for tasks)

**If correct**: Leave as-is

**If incorrect**:
1. Make manual corrections
2. Note the pattern for future prompt improvements
3. Update `claude_classification_prompt.md` if needed

---

## Classification Stats

```dataview
TABLE WITHOUT ID
  type as "Type",
  length(rows) as "Classified Today"
FROM ""
WHERE processed_by_ai = true
  AND date(modified) = date(today)
GROUP BY type
```

---

## Feedback Loop

**Common mistakes?** Update:
1. `AI/claude_classification_prompt.md` — Add examples
2. `AI/domain_tag_mapping.json` — Add domain rules

**Working well?** Great! The system learns from your corrections.

---

Last updated: 2025-10-18
