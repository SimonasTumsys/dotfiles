#!/usr/bin/env bash

# --- Functions ---

get_paired_devices() {
  bluetoothctl devices Paired \
    | awk '{print $2 "\t" substr($0, index($0,$3))}'
}

get_all_devices() {
  bluetoothctl devices \
    | awk '{print $2 "\t" substr($0, index($0,$3))}'
}

# --- Step 1: Build paired list + add Scan option ---
mapfile -t paired_devices < <(get_paired_devices)

paired_macs=()
paired_names=("Scan")
for e in "${paired_devices[@]}"; do
  mac=${e%%$'\t'*}
  name=${e#*$'\t'}
  paired_macs+=("$mac")
  paired_names+=("$name")
done

# --- Step 2: Rofi menu ---
choice_index=$(printf '%s\n' "${paired_names[@]}" \
  | rofi -dmenu -i -p "BT Manager" -format 'i')

status=$?
if (( status != 0 )) || [[ -z "$choice_index" ]]; then
  exit 0
fi

# --- Step 3: If "Scan" selected ---
if (( choice_index == 0 )); then
  # Trigger scan for 10 seconds
  gnome-terminal -- bash -c \
    "bluetoothctl scan on & sleep 10; bluetoothctl scan off" \
    >/dev/null 2>&1

  # After scan, collect all devices
  mapfile -t scanned_devices < <(get_all_devices)

  scanned_macs=()
  scanned_names=()
  for e in "${scanned_devices[@]}"; do
    mac=${e%%$'\t'*}
    name=${e#*$'\t'}
    scanned_macs+=("$mac")
    scanned_names+=("$name")
  done

  choice_index=$(printf '%s\n' "${scanned_names[@]}" \
    | rofi -dmenu -i -p "Scan results" -format 'i')

  [[ -z "$choice_index" ]] && exit 0
  selected_name="${scanned_names[$choice_index]}"
  selected_mac="${scanned_macs[$choice_index]}"

else
  # Normal paired device chosen
  selected_name="${paired_names[$choice_index]}"
  selected_mac="${paired_macs[$((choice_index-1))]}"
fi

# --- Step 4: Show result (for now) ---
echo "Selected: $selected_name"
echo "MAC: $selected_mac"

