#!/usr/bin/env bash

# prepare_inbox_batch.sh
# Extracts unprocessed items from IWin vault and formats for Claude Code classification

VAULT_PATH="/Users/zween/Sys_off/Claude/iWin"
OUTPUT_FILE="$VAULT_PATH/AI/inbox_batch.txt"

echo "=== IWin Inbox Batch for Claude Code Classification ===" > "$OUTPUT_FILE"
echo "Generated: $(date '+%Y-%m-%d %H:%M:%S')" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Count unprocessed items
unprocessed_count=0

# Find all markdown files
find "$VAULT_PATH" -name "*.md" -not -path "*/\.*" -not -path "*/System/*" -not -path "*/Dashboards/*" -not -path "*/Templates/*" -not -path "*/AI/*" | while read -r file; do
    # Check if file has frontmatter and is unprocessed
    if grep -q "^---$" "$file"; then
        # Extract frontmatter
        frontmatter=$(sed -n '/^---$/,/^---$/p' "$file" | sed '1d;$d')

        # Check if processed_by_ai is false OR missing priority/area/time_bucket
        processed=$(echo "$frontmatter" | grep "processed_by_ai:" | grep -i "true")
        priority=$(echo "$frontmatter" | grep "priority:" | grep -v "priority: \"\"" | grep -v "priority: null")
        area=$(echo "$frontmatter" | grep "area:" | grep -v "area: \"\"" | grep -v "area: null")
        time_bucket=$(echo "$frontmatter" | grep "time_bucket:" | grep -v "time_bucket: \"\"" | grep -v "time_bucket: null")

        if [ -z "$processed" ] && ([ -z "$priority" ] || [ -z "$area" ] || [ -z "$time_bucket" ]); then
            ((unprocessed_count++))

            # Extract key fields
            title=$(echo "$frontmatter" | grep "^title:" | sed 's/title: *//' | tr -d '"')
            type=$(echo "$frontmatter" | grep "^type:" | sed 's/type: *//' | tr -d '"')
            tags=$(echo "$frontmatter" | grep "^tags:" | sed 's/tags: *//')
            url=$(echo "$frontmatter" | grep "^url:" | sed 's/url: *//' | tr -d '"')

            # Get first few lines of content (after frontmatter)
            content=$(sed -n '/^---$/,/^---$/!p' "$file" | head -n 10 | grep -v "^#" | grep -v "^$" | head -n 3)

            # Write to output
            echo "---" >> "$OUTPUT_FILE"
            echo "ITEM $unprocessed_count:" >> "$OUTPUT_FILE"
            echo "File: $(basename "$file")" >> "$OUTPUT_FILE"
            [ -n "$title" ] && echo "Title: $title" >> "$OUTPUT_FILE"
            [ -n "$type" ] && echo "Type: $type" >> "$OUTPUT_FILE"
            [ -n "$tags" ] && echo "Tags: $tags" >> "$OUTPUT_FILE"
            [ -n "$url" ] && echo "URL: $url" >> "$OUTPUT_FILE"
            echo "" >> "$OUTPUT_FILE"
            if [ -n "$content" ]; then
                echo "Content Preview:" >> "$OUTPUT_FILE"
                echo "$content" >> "$OUTPUT_FILE"
            fi
            echo "" >> "$OUTPUT_FILE"
        fi
    fi
done

# Add context about existing Areas, Priorities
echo "" >> "$OUTPUT_FILE"
echo "=== CLASSIFICATION CONTEXT ===" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Available Areas:" >> "$OUTPUT_FILE"
echo "- Work (professional work, career, business)" >> "$OUTPUT_FILE"
echo "- Personal (home, admin, life management)" >> "$OUTPUT_FILE"
echo "- Learning (education, skill development)" >> "$OUTPUT_FILE"
echo "- Health (physical & mental health, fitness)" >> "$OUTPUT_FILE"
echo "- Finance (money, investments, financial planning)" >> "$OUTPUT_FILE"
echo "- Social (relationships, family, friends, community)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Priority Levels:" >> "$OUTPUT_FILE"
echo "- P1: Urgent & Important (do first)" >> "$OUTPUT_FILE"
echo "- P2: Important but Not Urgent (schedule)" >> "$OUTPUT_FILE"
echo "- P3: Urgent but Not Important (minimize/delegate)" >> "$OUTPUT_FILE"
echo "- P4: Neither Urgent nor Important (consider deleting)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Time Buckets:" >> "$OUTPUT_FILE"
echo "- Today (due today)" >> "$OUTPUT_FILE"
echo "- This Week (this week)" >> "$OUTPUT_FILE"
echo "- This Month (this month)" >> "$OUTPUT_FILE"
echo "- Someday (no specific timeframe)" >> "$OUTPUT_FILE"
echo "- Waiting (blocked/waiting on others)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Energy Levels (for tasks):" >> "$OUTPUT_FILE"
echo "- High (requires peak focus and energy)" >> "$OUTPUT_FILE"
echo "- Medium (moderate focus needed)" >> "$OUTPUT_FILE"
echo "- Low (can do when tired, quick wins)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Summary
echo "=== READY FOR CLASSIFICATION ===" >> "$OUTPUT_FILE"
echo "Total unprocessed items: $unprocessed_count" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Next steps:" >> "$OUTPUT_FILE"
echo "1. Copy the contents of this file" >> "$OUTPUT_FILE"
echo "2. Paste to Claude Code" >> "$OUTPUT_FILE"
echo "3. Ask Claude to classify each item with proper frontmatter" >> "$OUTPUT_FILE"
echo "4. Save Claude's output to AI/classification_results.json" >> "$OUTPUT_FILE"
echo "5. Run ./AI/apply_ai_results.py to update the vault" >> "$OUTPUT_FILE"

echo "✅ Batch prepared: $OUTPUT_FILE"
echo "📊 Found $unprocessed_count unprocessed items"
echo ""
echo "Next: Copy contents of $OUTPUT_FILE and paste to Claude Code"
