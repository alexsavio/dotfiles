#!/usr/bin/env python3
import os
import re
import glob

AGENT_DIR = os.path.expanduser("~/.config/opencode/agent")

def convert_tools(tools_str):
    """Convert Claude tools format to Opencode format."""
    tools_list = [t.strip() for t in tools_str.split(',')]
    
    # Define mappings
    has_write = 'Write' in tools_list
    has_edit = 'Edit' in tools_list
    has_bash = 'Bash' in tools_list
    has_webfetch = 'WebFetch' in tools_list or 'WebSearch' in tools_list
    
    # Build the tools section
    lines = []
    lines.append(f"  write: {str(has_write).lower()}")
    lines.append(f"  edit: {str(has_edit).lower()}")
    lines.append(f"  bash: {str(has_bash).lower()}")
    
    if has_webfetch:
        lines.append(f"  webfetch: {str(has_webfetch).lower()}")
    
    return "\n".join(lines)

def convert_file(filepath):
    """Convert a single agent file from Claude to Opencode format."""
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Parse the frontmatter
    match = re.match(r'^---\n(.*?)\n---\n(.*)$', content, re.DOTALL)
    if not match:
        print(f"  Skipping {filepath}: no valid frontmatter")
        return False
    
    frontmatter = match.group(1)
    body = match.group(2).strip()
    
    # Extract fields from frontmatter
    name_match = re.search(r'^name:\s*(.+)$', frontmatter, re.MULTILINE)
    desc_match = re.search(r'^description:\s*(.+)$', frontmatter, re.MULTILINE)
    tools_match = re.search(r'^tools:\s*(.+)$', frontmatter, re.MULTILINE)
    
    if not desc_match:
        print(f"  Skipping {filepath}: no description found")
        return False
    
    description = desc_match.group(1).strip()
    tools_str = tools_match.group(1).strip() if tools_match else "Read"
    
    # Build new frontmatter in Opencode format
    new_frontmatter_lines = [
        "---",
        f"description: {description}",
        "mode: subagent",
        "tools:",
        convert_tools(tools_str),
        "---"
    ]
    
    new_content = "\n".join(new_frontmatter_lines) + "\n\n" + body
    
    # Write the converted file
    with open(filepath, 'w') as f:
        f.write(new_content)
    
    return True

def main():
    # Find all markdown files
    pattern = os.path.join(AGENT_DIR, "*.md")
    files = glob.glob(pattern)
    
    print(f"Found {len(files)} agent files to convert")
    
    converted = 0
    skipped = 0
    
    for filepath in sorted(files):
        filename = os.path.basename(filepath)
        print(f"Converting {filename}...")
        if convert_file(filepath):
            converted += 1
        else:
            skipped += 1
    
    print(f"\nDone! Converted: {converted}, Skipped: {skipped}")

if __name__ == "__main__":
    main()
