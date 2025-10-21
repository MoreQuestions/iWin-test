# Priorities — Reference Database

Priority levels for task classification.

---

## Priority Definitions

### [[P1]] — Urgent & Important
- Must be done today or this week
- Direct impact on critical goals
- Cannot be delegated or delayed
- Examples: Hard deadlines, crises, critical decisions

### [[P2]] — Important but Not Urgent
- Significant long-term impact
- Should be done this week/month
- Contributes to major goals
- Examples: Planning, relationship building, learning

### [[P3]] — Urgent but Not Important
- Time-sensitive but low impact
- Can often be delegated
- Should be minimized
- Examples: Some emails, interruptions, minor requests

### [[P4]] — Neither Urgent nor Important
- Low priority, low impact
- Do when time permits
- Consider if it's worth doing at all
- Examples: Nice-to-haves, wishlist items

---

## Usage in IWin

Link to priorities in task frontmatter:

```yaml
priority: "[[P1]]"
```

This creates a backlink and allows Dataview filtering:

```dataview
TASK
WHERE priority = [[P1]]
```

---

## AI Classification Guidance

Claude Code will assign priorities based on:
- Time sensitivity (due date proximity)
- Goal alignment (success criteria)
- Impact assessment (consequences of not doing)
- User patterns (historical priority assignments)

You can always override AI suggestions during review.

---

Last updated: 2025-10-18
