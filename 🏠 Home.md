# 🏠 IWin — Your Task & Knowledge Management System

Welcome to IWin! This is your central command center for managing tasks, projects, areas, and wins.

---

## 🚀 Quick Start

**New here?** Start by capturing something in the Inbox:
- Use QuickAdd hotkey (configure in Obsidian)
- Or create a new note manually and leave Area/Priority blank

**Daily workflow:**
1. Check [[📥 Inbox]] for unprocessed items
2. Review [[📅 Today]] dashboard
3. Check [[📆 This Week]] for upcoming tasks
4. End of day: Capture [[🏆 Wins]]

---

## 📊 Main Dashboards

- [[📥 Inbox]] — Unprocessed items needing classification
- [[📅 Today]] — Tasks due today
- [[📆 This Week]] — This week's tasks
- [[🎯 Priority Board]] — Tasks grouped by priority
- [[🗂 Area Kanban]] — Tasks by life area and time bucket
- [[🏆 Wins]] — Your achievements and celebrations
- [[🤖 AI Review]] — Items classified by Claude Code (review before accepting)
- [[🗄 Archive]] — Completed, cancelled, or abandoned items

---

## 🧱 System Structure

### Core Databases (in `/System/Bases`)
- **Master List** — All tasks, notes, ideas, bookmarks
- **Priorities** — P1 (Urgent), P2 (Important), P3 (Medium), P4 (Low)
- **Areas** — Life areas (Work, Personal, Learning, Health, Finance, Social)
- **Tags** — Active and proposed tags for organization
- **Lists** — Custom lists and collections
- **Wins** — Achievements worth celebrating

### AI Integration
- **Claude Code** — Semi-automated classification
- Run `./AI/prepare_inbox_batch.sh` to extract inbox items
- Paste to Claude Code for classification
- Run `./AI/apply_ai_results.py` to update notes

### Version Control
- Automatic hourly commits via Obsidian Git plugin
- View history in GitHub Desktop
- Revert to any previous state
- Manual commits for milestones

---

## ⚙️ Configuration

### Essential Plugins (Install from Community Plugins)
- ✅ **Dataview** — Powers all dashboards
- ✅ **Obsidian Git** — Automatic version control
- ✅ **QuickAdd** — Fast capture workflows
- ✅ **Kanban** — Board views

### Recommended Settings
- **Optimization Limit:** Max 30 minutes/month tweaking
- **MVP Approach:** Add plugins only when truly needed
- **Simplicity First:** Done is better than perfect

---

## 📖 Documentation

- [[IWin-System-Manual-vFinal]] — Complete system manual
- [[IWin-ToDo]] — Implementation checklist
- [[system-log]] — Change history and technical details

---

## 🎯 Philosophy

**Zero-Friction Capture** → **AI Classification** → **Minimal Manual Work** → **Get Things Done**

*"The best system is the one you actually use."*

---

Last updated: 2025-10-18
