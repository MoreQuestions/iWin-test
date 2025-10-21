# Master List — All Items Database

This is the conceptual "Master List" containing all tasks, notes, ideas, bookmarks, and projects.

In Obsidian, the Master List is not a single file but rather **all notes in the vault** with proper frontmatter properties.

---

## Properties Schema

Every item in IWin has these frontmatter properties:

```yaml
---
# Core Properties
title: "Item title"
type: "Task | Note | Idea | Bookmark | Project"
priority: "[[P1]] | [[P2]] | [[P3]] | [[P4]]"
area: "[[Work]] | [[Personal]] | [[Learning]] | [[Health]] | [[Finance]] | [[Social]]"
time_bucket: "Today | This Week | This Month | Someday | Waiting"

# Organization
tags: []
lists: []
status: "Active | Done | Cancelled | Abandoned | Archived | Ongoing"
visibility: "Active | Hidden"

# Workflow
processed_by_ai: false
origin_item: null
related_items: []

# Bookmarks (if type: Bookmark)
url: ""
resolved_title: ""
site: ""
favicon_path: ""

# Tasks (if type: Task)
energy: "High | Medium | Low"
due_date: null
review_date: null
snooze_until: null
success_criteria: ""
recurrence: ""

# Metadata
created: 2025-10-18
modified: 2025-10-18
completed_date: null
---
```

---

## Field Descriptions

### Core Properties
- **title**: The item's name/description
- **type**: Task, Note, Idea, Bookmark, or Project
- **priority**: Link to priority (P1-P4)
- **area**: Link to life area
- **time_bucket**: When to work on this

### Organization
- **tags**: Array of tags for categorization
- **lists**: Custom list memberships
- **status**: Current state
- **visibility**: Active (visible) or Hidden (archived from views)

### Workflow
- **processed_by_ai**: Has Claude classified this?
- **origin_item**: Link to note this spawned from
- **related_items**: Links to related notes

### Bookmarks
- **url**: Original URL
- **resolved_title**: Extracted page title
- **site**: Domain name
- **favicon_path**: Path to saved favicon

### Tasks
- **energy**: Required energy level
- **due_date**: Hard deadline
- **review_date**: Date to review/reconsider
- **snooze_until**: Hidden until this date
- **success_criteria**: What defines "done"
- **recurrence**: Recurring pattern

### Metadata
- **created**: Creation timestamp
- **modified**: Last modification timestamp
- **completed_date**: When marked done

---

## Usage

**Don't edit this file.** Instead:

1. Create new notes anywhere in the vault
2. Add frontmatter properties
3. Dataview queries will aggregate all notes into dashboards

**Example Task:**

```markdown
---
title: "Finish IWin setup"
type: "Task"
priority: "[[P1]]"
area: "[[Personal]]"
time_bucket: "Today"
tags: [productivity, obsidian]
status: "Active"
visibility: "Active"
processed_by_ai: true
energy: "Medium"
created: 2025-10-18
modified: 2025-10-18
---

# Finish IWin setup

Set up the full IWin system with Claude Code.

## Steps
- [x] Research approach
- [x] Choose platform (Obsidian)
- [ ] Complete setup
- [ ] Test workflows
```

---

## Dataview Queries

Access the Master List via Dataview:

```dataview
TABLE type, priority, area, time_bucket, status
FROM ""
WHERE type != null
SORT created DESC
```

Or use the pre-built dashboards in `/Dashboards`.

---

Last updated: 2025-10-18
