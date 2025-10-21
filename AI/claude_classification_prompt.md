# Claude Code Classification Prompt for IWin

Use this prompt when classifying inbox items.

---

## Prompt

```
I need you to classify tasks/notes/bookmarks for my IWin task management system.

For each ITEM in the batch, analyze it and assign:

1. **priority**: P1, P2, P3, or P4
   - P1: Urgent & Important (must do soon, high impact)
   - P2: Important but Not Urgent (significant long-term value)
   - P3: Urgent but Not Important (time-sensitive, low impact)
   - P4: Neither Urgent nor Important (consider deleting)

2. **area**: Life domain this belongs to
   - Work, Personal, Learning, Health, Finance, Social

3. **time_bucket**: When to do this
   - Today (urgent, due today)
   - This Week (this week)
   - This Month (this month)
   - Someday (no specific timeframe)
   - Waiting (blocked/waiting on others)

4. **energy**: (For tasks only) Energy level required
   - High (peak focus needed)
   - Medium (moderate focus)
   - Low (can do when tired, quick wins)

5. **tags**: Relevant tags (2-5 tags max)
   - Examples: urgent, quick-win, deep-work, meeting, research, etc.
   - Keep tags specific and actionable
   - Don't over-tag

6. **type**: Confirm or correct the type
   - Task (actionable item)
   - Note (reference, knowledge)
   - Idea (potential future action)
   - Bookmark (saved link)
   - Project (collection of tasks)

Output as JSON array:

```json
[
  {
    "file": "filename.md",
    "priority": "[[P1]]",
    "area": "[[Work]]",
    "time_bucket": "Today",
    "energy": "Medium",
    "tags": ["urgent", "email", "quick-win"],
    "type": "Task",
    "success_criteria": "Email sent and acknowledged"
  },
  {
    "file": "another-file.md",
    "priority": "[[P2]]",
    "area": "[[Learning]]",
    "time_bucket": "This Week",
    "energy": "High",
    "tags": ["deep-work", "course", "skill-building"],
    "type": "Task",
    "success_criteria": "Complete module 1"
  }
]
```

Guidelines:
- Be conservative with P1 (only true urgency + importance)
- Most tasks should be P2 or P3
- P4 tasks should be questioned - are they worth doing?
- For bookmarks: infer area from domain/content
- For notes: area based on topic
- Energy levels help with scheduling (High = morning, Low = afternoon slump)
- Success criteria help define "done" (optional but helpful for complex tasks)
```

---

## Example Classification

**Input:**
```
ITEM 1:
File: Fix production bug.md
Title: Fix production bug in user authentication
Type: Task

Content Preview:
Users reporting they can't log in. Need to investigate and fix ASAP.
Error appears to be in JWT token validation.
```

**Output:**
```json
[
  {
    "file": "Fix production bug.md",
    "priority": "[[P1]]",
    "area": "[[Work]]",
    "time_bucket": "Today",
    "energy": "High",
    "tags": ["urgent", "bug", "production", "authentication"],
    "type": "Task",
    "success_criteria": "Bug fixed, users can log in, no error logs"
  }
]
```

---

**Input:**
```
ITEM 2:
File: Book - Atomic Habits.md
Title: Read Atomic Habits by James Clear
Type: Task
Tags: [book, reading]
```

**Output:**
```json
[
  {
    "file": "Book - Atomic Habits.md",
    "priority": "[[P2]]",
    "area": "[[Learning]]",
    "time_bucket": "This Month",
    "energy": "Medium",
    "tags": ["book", "reading", "habits", "personal-development"],
    "type": "Task",
    "success_criteria": "Book finished, key takeaways noted"
  }
]
```

---

## Tips for Good Classifications

- **Context matters**: Consider the user's likely priorities
- **Be realistic with time**: Don't mark everything "Today"
- **Energy levels help**: High energy tasks = deep work, Low = quick wins
- **Tags should add value**: Don't just repeat what's in title
- **Success criteria**: Especially useful for vague tasks

---

Last updated: 2025-10-18
