# Areas — Life Domains Database

Areas represent the major domains of your life. Every task belongs to exactly one area.

---

## Default Areas

- [[Work]] — Professional work, career, business
- [[Personal]] — Personal admin, home, life management
- [[Learning]] — Education, skill development, knowledge acquisition
- [[Health]] — Physical health, mental health, fitness
- [[Finance]] — Money, investments, financial planning
- [[Social]] — Relationships, family, friends, community

---

## Customization

You can add more areas as needed, but **keep it simple**. Too many areas defeats the purpose.

**Good additions:**
- Creative
- Spiritual
- Travel
- Hobbies

**Avoid:**
- Too granular (Work-Email, Work-Meetings)
- Overlapping categories
- More than 10 total areas

---

## Usage

Link to areas in frontmatter:

```yaml
area: "[[Work]]"
```

---

## AI Classification

Claude Code will classify items into areas based on:
- Keywords in title/content
- Context clues
- Historical patterns

You can define custom rules in `domain_tag_mapping.json`.

---

Last updated: 2025-10-18
