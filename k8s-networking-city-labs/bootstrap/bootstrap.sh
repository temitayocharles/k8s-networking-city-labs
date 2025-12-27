#!/usr/bin/env bash
# Repo Bootstrapper
# Version: 1.0.0
# Purpose: Generate deterministic lab repository structure
set -euo pipefail

# Dependency check
echo "[bootstrap] Checking dependencies..."
command -v envsubst >/dev/null 2>&1 || {
  echo "ERROR: envsubst not found. Install gettext." >&2
  exit 1
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="${SCRIPT_DIR}/../k8s-networking-city-labs"
TEMPLATE_DIR="${SCRIPT_DIR}/templates"
DATA_FILE="${SCRIPT_DIR}/labs.csv"
FORCE=false
DRY_RUN=false
SKIPPED_FILES=()
usage() {
  echo "Usage: $0 [--force] [--dry-run]"
  exit 1
}
for arg in "$@"; do
  case "$arg" in
    --force) FORCE=true ;;
    --dry-run) DRY_RUN=true ;;
    *) usage ;;
  esac
}
log() {
  echo "[bootstrap] $1"
}
create() {
  if $DRY_RUN; then
    echo "[DRY-RUN] $*"
  else
    eval "$@"
  fi
}
render() {
  local template="$1"
  local output="$2"
  if [[ -f "$output" && "$FORCE" == false ]]; then
    log "Skipping existing file: $output"
    SKIPPED_FILES+=("$output")
    return
  fi
  create "envsubst < \"$template\" > \"$output\""
}
log "Initializing repository structure"
create "mkdir -p \"$ROOT_DIR\""
cd "$ROOT_DIR"
create "mkdir -p prerequisites appendix assets linux-labs kubernetes-equivalents failure-labs"
log "Generating labs"
tail -n +2 "$DATA_FILE" | while IFS=',' read -r track id slug title; do
  export LAB_ID="$id"
  export LAB_TITLE="$title"
  case "$track" in
    linux)
      BASE="linux-labs/lab-${id}-${slug}"
      ;;
    k8s)
      BASE="kubernetes-equivalents/k8s-lab-${id}-${slug}"
      ;;
    failure)
      BASE="failure-labs/failure-${id}-${slug}"
      ;;
    *)
      echo "ERROR: Unknown track '$track' in labs.csv" >&2
      exit 1
      ;;
  esac
  create "mkdir -p \"$BASE\""
  render "$TEMPLATE_DIR/lab/README.md.tpl" "$BASE/README.md"
  render "$TEMPLATE_DIR/lab/objectives.md.tpl" "$BASE/objectives.md"
  render "$TEMPLATE_DIR/lab/steps.md.tpl" "$BASE/steps.md"
  render "$TEMPLATE_DIR/lab/verification.md.tpl" "$BASE/verification.md"
  render "$TEMPLATE_DIR/lab/cleanup.md.tpl" "$BASE/cleanup.md"
done
# Render root files
render "$TEMPLATE_DIR/root/README.md.tpl" "$ROOT_DIR/README.md"
render "$TEMPLATE_DIR/root/LICENSE.tpl" "$ROOT_DIR/LICENSE"
if [ ${#SKIPPED_FILES[@]} -gt 0 ]; then
  log "Skipped ${#SKIPPED_FILES[@]} existing files"
fi
log "Bootstrap complete"
if $DRY_RUN; then
  log "Dry run finished. No files were created."
else
  log "Repository ready at: $ROOT_DIR"
fi
