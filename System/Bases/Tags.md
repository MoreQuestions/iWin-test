# Tags — Organization & Categorization

Tags provide flexible categorization beyond Areas and Priorities.

---

## Tag Philosophy

**Keep it controlled.** Uncontrolled tags lead to chaos.

### Active Tags vs. Proposed Tags

- **Active Tags**: Approved, in regular use
- **Proposed Tags**: Suggested by AI, pending review

New tags from AI classification start as "Proposed" and move to "Active" after manual approval.

---

## Current Active Tags

(Add approved tags here as they emerge)

Examples:
- `urgent`
- `waiting-on-others`
- `quick-win` (< 15 min)
- `deep-work` (requires focus)
- `meeting`
- `email`
- `research`

---

## Proposed Tags

Tags suggested by Claude Code but not yet approved:

(Will be populated via AI classification)

---

## Usage

Add tags in frontmatter:

```yaml
tags: [urgent, quick-win, email]
```

Query by tag:

```dataview
TABLE
FROM #urgent
WHERE status = "Active"
```

---

## Tag Governance

**Review proposed tags weekly:**
1. Accept → Move to Active Tags
2. Reject → Remove from notes
3. Merge → Consolidate with existing tag

**Delete unused tags monthly.**

---

Last updated: 2025-10-18
