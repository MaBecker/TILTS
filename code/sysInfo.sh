#!/bin/bash
# License: MIT
# Repository: 
# Tested on: Macos
# 
# print system info as one line
# -v verbose with each topic on it's own line
# -vv full hardware and display data

verbose=0
while getopts "v" opt; do
  case "$opt" in
    v) ((verbose++)) ;;
    *) echo "Usage: $0 [-v|-vv]"; exit 1 ;;
  esac
done

HW_INFO=$(system_profiler SPHardwareDataType 2>/dev/null)
GPU_INFO=$(system_profiler SPDisplaysDataType 2>/dev/null)

# Model
MODEL=$(awk -F": " '/Model Name/ {print $2; exit}' <<< "$HW_INFO")

# Chip Apple Silicon or Intel
CHIP=$(awk -F": " '/Chip:/ {print $2; exit} /Processor Name:/ {print $2; exit}' <<< "$HW_INFO")

# RAM
RAM=$(awk -F": " '/Memory/ {print $2; exit}' <<< "$HW_INFO")

# CPU cores (total)
CPU_CORES=$(sysctl -n hw.ncpu)

# GPU cores
GPU_CORES=$(awk -F": " '/Total Number of Cores/ {print $2; exit}' <<< "$GPU_INFO")

# Defaults
MODEL=${MODEL:-0}
CHIP=${CHIP:-0}
RAM=${RAM:-0}
CPU_CORES=${CPU_CORES:-0}
GPU_CORES=${GPU_CORES:-0}

if ((verbose == 1)); then
  echo "Model: $MODEL"
  echo "Chip: $CHIP"
  echo "RAM: $RAM"
  echo "CPU cores: $CPU_CORES"
  echo "GPU cores: $GPU_CORES"
elif ((verbose == 2)); then
  echo "$HW_INFO"
  echo
  echo "$GPU_INFO" 
else 
  echo "$MODEL, $CHIP, $RAM, $CPU_CORES CPUs, $GPU_CORES GPUs"
fi