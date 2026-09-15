#!/usr/bin/env bash

get_split() {
  i3-msg -t get_tree | jq -r '
    [recurse(.nodes[]?, .floating_nodes[]?)
     | select(any(.nodes[]?; .focused))
     | .layout] | last // "none"
  '
}

render() {
  case "$(get_split)" in
    splith)  echo "󰤼" ;;   # horizontal: next window right
    splitv)  echo "󰤻" ;;   # vertical: next window below
    tabbed)  echo "󰓩" ;;
    stacked) echo "󰙀" ;;
    *)       echo "─" ;;
  esac
}

render
i3-msg -t subscribe -m '["window","workspace","binding"]' | while read -r _; do
  render
done
