#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

zed_dir="$HOME/.config/zed/themes"
claude_dir="$HOME/.claude/themes"

install_file() {
    local src=$1 dst=$2
    mkdir -p "$(dirname "$dst")"
    rm -f "$dst"
    cp "$src" "$dst"
}

install_file "$here/zed/ayu-mirage-high-contrast.json" "$zed_dir/ayu-mirage-high-contrast.json"
install_file "$here/claude/ayu-mirage.json"            "$claude_dir/ayu-mirage.json"

echo "copied themes into $zed_dir and $claude_dir"
