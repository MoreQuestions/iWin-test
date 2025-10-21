#!/usr/bin/env python3

"""
apply_ai_results.py
Applies Claude Code classification results to IWin vault files.

Usage:
    python3 apply_ai_results.py classification_results.json

Or paste JSON directly when prompted.
"""

import json
import sys
import os
import re
from datetime import datetime
from pathlib import Path

VAULT_PATH = Path("/Users/zween/Sys_off/Claude/iWin")

def parse_frontmatter(content):
    """Extract frontmatter and content from markdown file."""
    if not content.startswith('---'):
        return {}, content

    parts = content.split('---', 2)
    if len(parts) < 3:
        return {}, content

    frontmatter_str = parts[1]
    body = parts[2]

    # Parse YAML-style frontmatter
    frontmatter = {}
    for line in frontmatter_str.strip().split('\n'):
        if ':' in line:
            key, value = line.split(':', 1)
            key = key.strip()
            value = value.strip()

            # Handle arrays
            if value.startswith('[') and value.endswith(']'):
                # Simple array parsing
                value = value[1:-1]  # Remove brackets
                frontmatter[key] = [v.strip().strip('"\'') for v in value.split(',') if v.strip()]
            # Handle quoted strings
            elif value.startswith('"') and value.endswith('"'):
                frontmatter[key] = value[1:-1]
            # Handle booleans
            elif value.lower() in ['true', 'false']:
                frontmatter[key] = value.lower() == 'true'
            # Handle null
            elif value.lower() == 'null':
                frontmatter[key] = None
            else:
                frontmatter[key] = value

    return frontmatter, body

def serialize_frontmatter(frontmatter):
    """Convert frontmatter dict back to YAML string."""
    lines = []
    for key, value in frontmatter.items():
        if isinstance(value, list):
            # Serialize arrays
            if value:
                value_str = '[' + ', '.join(str(v) for v in value) + ']'
            else:
                value_str = '[]'
        elif isinstance(value, bool):
            value_str = 'true' if value else 'false'
        elif value is None:
            value_str = 'null'
        elif isinstance(value, str):
            # Quote strings if they contain special characters
            if ':' in value or value.startswith('[['):
                value_str = f'"{value}"'
            else:
                value_str = value
        else:
            value_str = str(value)

        lines.append(f'{key}: {value_str}')

    return '\n'.join(lines)

def update_file(file_path, classifications):
    """Update a file with classifications from Claude."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        frontmatter, body = parse_frontmatter(content)

        # Update frontmatter with classifications
        if 'priority' in classifications:
            frontmatter['priority'] = classifications['priority']
        if 'area' in classifications:
            frontmatter['area'] = classifications['area']
        if 'time_bucket' in classifications:
            frontmatter['time_bucket'] = classifications['time_bucket']
        if 'energy' in classifications:
            frontmatter['energy'] = classifications['energy']
        if 'tags' in classifications:
            frontmatter['tags'] = classifications['tags']
        if 'type' in classifications:
            frontmatter['type'] = classifications['type']
        if 'success_criteria' in classifications and classifications['success_criteria']:
            frontmatter['success_criteria'] = classifications['success_criteria']

        # Mark as processed by AI
        frontmatter['processed_by_ai'] = True

        # Update modified date
        frontmatter['modified'] = datetime.now().strftime('%Y-%m-%d')

        # Rebuild file content
        new_content = f"---\n{serialize_frontmatter(frontmatter)}\n---{body}"

        # Write back
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)

        return True

    except Exception as e:
        print(f"❌ Error updating {file_path}: {e}")
        return False

def find_file(filename):
    """Find a file in the vault by name."""
    # Search for the file
    for file_path in VAULT_PATH.rglob('*.md'):
        if file_path.name == filename:
            return file_path
    return None

def main():
    print("=== IWin AI Classification Applier ===\n")

    # Get JSON input
    if len(sys.argv) > 1:
        # Read from file
        json_file = sys.argv[1]
        if not os.path.exists(json_file):
            print(f"❌ File not found: {json_file}")
            sys.exit(1)

        with open(json_file, 'r') as f:
            json_data = f.read()
    else:
        # Read from stdin/paste
        print("Paste Claude's JSON output (press Ctrl+D when done):\n")
        json_data = sys.stdin.read()

    # Parse JSON
    try:
        # Try to extract JSON if it's wrapped in markdown code blocks
        if '```json' in json_data:
            json_data = json_data.split('```json')[1].split('```')[0]
        elif '```' in json_data:
            json_data = json_data.split('```')[1].split('```')[0]

        classifications = json.loads(json_data.strip())

        if not isinstance(classifications, list):
            print("❌ Expected a JSON array")
            sys.exit(1)

    except json.JSONDecodeError as e:
        print(f"❌ Invalid JSON: {e}")
        sys.exit(1)

    # Apply classifications
    print(f"📝 Processing {len(classifications)} item(s)...\n")

    success_count = 0
    error_count = 0

    for item in classifications:
        filename = item.get('file')
        if not filename:
            print("⚠️  Item missing 'file' field, skipping")
            error_count += 1
            continue

        file_path = find_file(filename)
        if not file_path:
            print(f"⚠️  File not found: {filename}")
            error_count += 1
            continue

        # Remove 'file' from classifications before updating
        item_copy = {k: v for k, v in item.items() if k != 'file'}

        if update_file(file_path, item_copy):
            print(f"✅ Updated: {filename}")
            print(f"   Priority: {item.get('priority', 'N/A')}")
            print(f"   Area: {item.get('area', 'N/A')}")
            print(f"   Time Bucket: {item.get('time_bucket', 'N/A')}")
            print()
            success_count += 1
        else:
            error_count += 1

    # Summary
    print("=" * 50)
    print(f"✅ Successfully updated: {success_count}")
    print(f"❌ Errors: {error_count}")
    print(f"📊 Total processed: {len(classifications)}")
    print()
    print("Next steps:")
    print("1. Open Obsidian and verify the changes")
    print("2. Check the [[🤖 AI Review]] dashboard")
    print("3. Make any manual corrections needed")
    print("4. Check [[📥 Inbox]] - should be cleaner now!")

if __name__ == '__main__':
    main()
