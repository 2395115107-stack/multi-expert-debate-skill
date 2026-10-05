#!/usr/bin/env sh
# Install the multi-expert-debate skill into ZCode / Claude Code user skill dirs.
set -e
SRC="$(cd "$(dirname "$0")" && pwd)/multi-expert-debate/skills/multi-expert-debate"
if [ ! -f "$SRC/SKILL.md" ]; then
  echo "[x] skill not found: $SRC" >&2
  exit 1
fi
for DEST in "$HOME/.agents/skills" "$HOME/.claude/skills"; do
  mkdir -p "$DEST"
  rm -rf "$DEST/multi-expert-debate"
  cp -R "$SRC" "$DEST/multi-expert-debate"
done
echo "[ok] installed to:"
echo "  $HOME/.agents/skills/multi-expert-debate"
echo "  $HOME/.claude/skills/multi-expert-debate"
echo
echo "Restart ZCode / Claude Code, then try: 找几个专家分析一下这个方案"
