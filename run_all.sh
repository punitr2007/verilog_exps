#!/usr/bin/env bash
# ==============================================================================
# Script: run_all.sh
# Purpose: Bulk compile and simulate all Verilog experiments in lab_exps_verilog
#          Generates .out executables, .vcd waveforms, and dump.vcd symlinks.
# ==============================================================================

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=================================================================="
echo " DCS Lab Experiments (Verilog) - Bulk Compilation & Simulation   "
echo "=================================================================="
echo "Root Directory: $BASE_DIR"
echo ""

SUCCESS_COUNT=0
TOTAL_COUNT=0

for exp_dir in "$BASE_DIR"/exp*/; do
    [ -d "$exp_dir" ] || continue
    TOTAL_COUNT=$((TOTAL_COUNT + 1))
    exp_name="$(basename "$exp_dir")"
    
    echo -e "\n[\e[1;34m$exp_name\e[0m]"
    (
        cd "$exp_dir" || exit 1
        
        if [ "$exp_name" = "exp02_binary_to_gray_and_gray_to_binary_converter" ]; then
            # Binary to Gray
            iverilog -g2012 -o bin2gray.out bin2gray.v bin2gray_tb.v
            vvp bin2gray.out
            # Gray to Binary
            iverilog -g2012 -o gray_to_binary.out gray_to_binary.v gray_to_binary_tb.v
            vvp gray_to_binary.out
            ln -sf bin2gray.vcd dump.vcd
            echo -e "  \e[32m✔ Waveforms generated:\e[0m bin2gray.vcd, gray_to_binary.vcd"
        else
            # Find design and testbench files
            tb_file=$(ls *_tb.v *testbench.v 2>/dev/null | head -n 1)
            out_name="${tb_file%_tb.v}"
            out_name="${out_name%_testbench.v}.out"
            
            iverilog -g2012 -o "$out_name" *.v
            vvp "$out_name"
            
            # Create dump.vcd symlink
            vcd_file=$(ls *.vcd 2>/dev/null | grep -v '^dump.vcd$' | head -n 1)
            if [ -n "$vcd_file" ]; then
                ln -sf "$vcd_file" dump.vcd
                echo -e "  \e[32m✔ Waveform generated:\e[0m $vcd_file (symlinked to dump.vcd)"
            fi
        fi
    )
    SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
done

echo ""
echo "=================================================================="
echo -e "\e[1;32mAll $SUCCESS_COUNT / $TOTAL_COUNT experiments compiled & simulated successfully!\e[0m"
echo "=================================================================="
