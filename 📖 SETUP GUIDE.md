# 📖 IWin Setup Guide

Complete step-by-step guide to get your IWin system running.

---

## ✅ Prerequisites

- macOS (for Mac usage)
- iPhone (for mobile usage)
- Obsidian app (free)
- GitHub account (free)
- GitHub Desktop (free)
- Working Copy app for iOS ($20 one-time, optional but recommended)

---

## 🚀 Quick Start (30 Minutes)

### Step 1: Install Obsidian

1. Download Obsidian from https://obsidian.md
2. Install and open Obsidian
3. Click "Open folder as vault"
4. Select: `/Users/zween/Sys_off/Claude/iWin`
5. Obsidian should now open the IWin vault

**Expected result**: You should see the vault with folders and the 🏠 Home page.

---

### Step 2: Install Community Plugins

1. In Obsidian, go to **Settings** (gear icon)
2. Click **Community plugins** → **Turn on community plugins**
3. Click **Browse** and install these plugins:
   - **Dataview** (required — powers all dashboards)
   - **Obsidian Git** (required — version control)
   - **QuickAdd** (optional but recommended — fast capture)
   - **Kanban** (optional — board views)

4. After installing, **enable each plugin**:
   - Go to **Settings** → **Community plugins**
   - Toggle each plugin ON

**Expected result**: All dashboards should now work (they use Dataview).

---

### Step 3: Configure Obsidian Git Plugin

1. Go to **Settings** → **Obsidian Git**
2. Configure these settings:
   - **Vault backup interval**: 60 (minutes) — auto-commit hourly
   - **Auto pull interval**: 60 (minutes)
   - **Commit message**: `vault backup: {{date}}`
   - **Pull updates on startup**: ON
   - **Disable push**: OFF
   - **Disable notifications**: Your preference

**Note**: Git repository setup happens in Step 4.

---

### Step 4: Set Up Git Version Control

#### On Mac:

1. **Install Git** (if not installed):
   ```bash
   # Check if Git is installed
   git --version

   # If not installed, install via Homebrew:
   brew install git
   ```

2. **Initialize Git repository** in the vault:
   ```bash
   cd /Users/zween/Sys_off/Claude/iWin
   git init
   git add .
   git commit -m "Initial commit - IWin vault setup"
   ```

3. **Create GitHub repository**:
   - Go to https://github.com/new
   - Repository name: `iwin-vault` (or your choice)
   - **Private** repository (recommended)
   - Do NOT initialize with README
   - Click "Create repository"

4. **Connect local repo to GitHub**:
   ```bash
   cd /Users/zween/Sys_off/Claude/iWin
   git remote add origin https://github.com/YOUR_USERNAME/iwin-vault.git
   git branch -M main
   git push -u origin main
   ```

5. **Install GitHub Desktop**:
   - Download from https://desktop.github.com
   - Install and sign in with your GitHub account
   - Add existing repository: `/Users/zween/Sys_off/Claude/iWin`

**Expected result**:
- `git status` shows clean working tree
- GitHub Desktop shows your vault
- Obsidian Git plugin can commit/push automatically

---

### Step 5: Verify Everything Works

1. Open [[📥 Inbox]] dashboard — should show the example items
2. Open [[📅 Today]] dashboard — should show today's example task
3. Open [[🏆 Wins]] dashboard — should show the example win
4. Open [[🎯 Priority Board]] — should show tasks by priority

**All dashboards should display correctly with the example data.**

---

### Step 6: Test AI Classification Workflow

1. Create a quick test task:
   - Create new note: "Test task.md"
   - Add basic frontmatter:
     ```yaml
     ---
     type: "Task"
     title: "Test the AI classification workflow"
     ---
     ```

2. Run the batch preparation script:
   ```bash
   cd /Users/zween/Sys_off/Claude/iWin/AI
   ./prepare_inbox_batch.sh
   ```

3. Check the output:
   ```bash
   cat inbox_batch.txt
   ```

   You should see your test task listed!

4. **Copy the contents** of `inbox_batch.txt`

5. **Paste to Claude Code** (me!) and say:
   "Please classify these items according to the IWin classification prompt in AI/claude_classification_prompt.md"

6. **Copy my JSON response** and save it to a file:
   ```bash
   # I'll give you JSON, paste it when prompted:
   cat > classification_results.json
   # Paste the JSON, then press Ctrl+D
   ```

7. **Apply the classifications**:
   ```bash
   python3 apply_ai_results.py classification_results.json
   ```

8. **Verify in Obsidian**:
   - Reload your test task file
   - Should now have priority, area, time_bucket filled in!
   - Check [[🤖 AI Review]] dashboard

**Expected result**: Test task is now classified!

---

## 📱 iPhone Setup (Optional but Recommended)

### Install Obsidian Mobile

1. Install Obsidian from App Store (free)
2. Open Obsidian
3. Open vault via iCloud:
   - If using iCloud sync for vault, select the vault
   - If using Git, use Working Copy (next step)

### Install Working Copy (Git on iOS)

1. Install Working Copy from App Store ($20 for Pro features)
2. Open Working Copy
3. Clone your repository:
   - Tap **+** → **Clone repository**
   - Select GitHub
   - Sign in and select `iwin-vault`
   - Clone to device

4. Set up file mirroring:
   - In Working Copy, tap repository
   - Settings → **Linked Working Directories**
   - Link to Obsidian app folder

5. Configure automatic sync:
   - Use iOS Shortcuts app to create automation:
   - When Obsidian opens → Pull from remote
   - When Obsidian closes → Commit & Push

**Expected result**: Vault syncs between Mac and iPhone via Git!

---

## ⚙️ Advanced Configuration (Optional)

### QuickAdd Setup

Configure QuickAdd for ultra-fast capture:

1. **Settings** → **QuickAdd**
2. Add new choice: "Quick Task"
3. Template: Use "Task Template.md"
4. Assign hotkey (e.g., Cmd+Shift+N)

Now you can capture tasks instantly with the hotkey!

### Templater (Advanced)

For dynamic templates with dates, variables, etc.:

1. Install **Templater** plugin
2. Configure template folder: `/Templates`
3. Add Templater syntax to templates

### Daily Notes

1. **Settings** → **Daily notes**
2. Template location: Create a daily note template
3. Folder: `Daily` (create this folder)
4. Format: `YYYY-MM-DD`

---

## 🎯 Daily Workflow

### Morning (5 minutes)

1. Open [[📅 Today]] dashboard
2. Review P1 tasks (do these first)
3. Quick scan of [[📥 Inbox]]
4. If inbox has items:
   - Run `./AI/prepare_inbox_batch.sh`
   - Classify with Claude Code
   - Apply results

### During Day

- Capture new tasks/notes as they come up
- Don't worry about classification — just capture
- Check [[📅 Today]] periodically

### Evening (5 minutes)

1. Mark completed tasks as Done
2. Add any wins to [[🏆 Wins]]
3. Quick review of tomorrow's tasks

### Weekly (15 minutes)

1. Sunday planning session
2. Review [[📆 This Week]]
3. Clear [[📥 Inbox]] completely
4. Review [[🤖 AI Review]] for any misclassifications
5. Check [[🎯 Priority Board]] for balance

---

## 🔧 Troubleshooting

### Dashboards show no data

- **Cause**: Dataview plugin not enabled
- **Fix**: Settings → Community plugins → Enable Dataview

### Git push fails

- **Cause**: Remote repository not set up
- **Fix**: Follow Step 4 again, ensure `git remote -v` shows GitHub URL

### iPhone not syncing

- **Cause**: Working Copy not configured
- **Fix**: Check Working Copy settings, ensure auto-sync shortcuts are set up

### AI classification script errors

- **Cause**: Python not found or script not executable
- **Fix**:
  ```bash
  chmod +x /Users/zween/Sys_off/Claude/iWin/AI/*.sh
  chmod +x /Users/zween/Sys_off/Claude/iWin/AI/*.py
  # Ensure Python 3 is installed
  python3 --version
  ```

---

## 🎉 You're Done!

Your IWin system is now ready to use!

**Remember**:
- ✅ **30-minute/month optimization limit** — resist the urge to endlessly tweak
- ✅ **Done is better than perfect** — use the system, don't perfect it
- ✅ **Capture first, classify later** — zero-friction input
- ✅ **Review the [[🏠 Home]] page** for quick reference

**Start using it!** Add your first real task, classify it, and get things done.

---

## 📚 Additional Resources

- [[IWin-System-Manual-vFinal]] — Complete system documentation
- [[IWin-ToDo]] — Implementation checklist
- [[system-log]] — Change log
- [Obsidian Documentation](https://help.obsidian.md)
- [Dataview Documentation](https://blacksmithgu.github.io/obsidian-dataview/)
- [Obsidian Git Plugin](https://github.com/denolehov/obsidian-git)

---

Last updated: 2025-10-18

**Need help?** Ask Claude Code! 🚀
