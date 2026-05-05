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

# macOS Terminal.app: importing a .terminal file requires Terminal to read it,
# so we hand it off via `open` (only on macOS). This adds the profile but does
# not set it as the default — Terminal → Settings → Profiles → "Default" still
# has to be done manually.
if [[ "$(uname)" == "Darwin" ]]; then
    open "$here/terminal/ayu-mirage.terminal"
    echo "imported terminal/ayu-mirage.terminal into Terminal.app"
fi

# Telegram Desktop has no scriptable theme-import path — load
# telegram/ayu-mirage.tdesktop-theme via Settings → Chat Settings → Custom theme.
echo "telegram/ayu-mirage.tdesktop-theme: load it manually via Telegram → Settings → Chat Settings"
