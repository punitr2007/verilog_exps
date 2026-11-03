# Digital Circuit & Systems (DCS) - Verilog Lab Experiments

[![Verilog-2012](https://img.shields.io/badge/Verilog-IEEE--1364--2012-blue.svg)](https://en.wikipedia.org/wiki/Verilog)
[![Simulator-Icarus](https://img.shields.io/badge/Simulator-Icarus--Verilog-green.svg)](http://iverilog.icarus.com/)
[![Viewer-GTKWave](https://img.shields.io/badge/Waveform-GTKWave-orange.svg)](http://gtkwave.sourceforge.net/)
[![Synthesis-Xilinx_ISE](https://img.shields.io/badge/EDA-Xilinx--ISE-red.svg)](https://www.xilinx.com/)

A comprehensive, production-grade laboratory repository containing **13 complete Verilog HDL digital circuit experiments**. Each experiment is self-contained with modular design files, comprehensive testbenches, automated simulation runs, and Value Change Dump (`.vcd`) waveform outputs viewable in GTKWave.

---

## 📑 Table of Contents

- [Overview](#-overview)
- [Experiment Catalog](#-experiment-catalog)
- [Repository Structure](#-repository-structure)
- [Toolchain & Prerequisites](#-toolchain--prerequisites)
- [Quick Start](#-quick-start)
- [Detailed Experiment Documentation](#-detailed-experiment-documentation)
  - [Exp 01: Basic Logic Gates](#exp-01-basic-logic-gates)
  - [Exp 02: Binary to Gray & Gray to Binary](#exp-02-binary-to-gray--gray-to-binary-converter)
  - [Exp 03: Half Adder](#exp-03-half-adder)
  - [Exp 04: Full Adder](#exp-04-full-adder)
  - [Exp 05: 8-to-1 Multiplexer](#exp-05-8-to-1-multiplexer)
  - [Exp 06: 2-to-4 Decoder](#exp-06-2-to-4-decoder)
  - [Exp 07: 4-Bit Parallel Adder](#exp-07-4-bit-parallel-adder)
  - [Exp 08: 3-Bit Magnitude Comparator](#exp-08-3-bit-magnitude-comparator)
  - [Exp 09: SR Latch & D Latch](#exp-09-sr-latch--d-latch-nand-gate-level)
  - [Exp 10: SR & JK Flip-Flops](#exp-10-sr-flip-flop--jk-flip-flop)
  - [Exp 11: 4-Bit SISO Shift Register](#exp-11-4-bit-siso-shift-register-structural-nand)
  - [Exp 12: 4-Bit PISO Shift Register](#exp-12-4-bit-piso-shift-register)
  - [Exp 13: 4-Bit Up-Down Counter](#exp-13-4-bit-synchronous-up-down-counter)
- [Bulk Execution (`run_all.sh`)](#-bulk-execution-run_allsh)
- [Author & Maintenance](#-author--maintenance)

---

## 🔭 Overview

This repository provides hardware description models for standard digital electronics and computer organization curricula. The experiments span from foundational combinational logic to advanced sequential synchronous systems:

* **Combinational Circuits**: Logic gates, code converters, adders/subtractors, decoders, multiplexers, and magnitude comparators.
* **Sequential Circuits**: Latches (SR and D), flip-flops (SR, JK with toggle state), registers (SISO and PISO), and counters (Up-Down binary).
* **Modeling Styles**: Behavioral modeling (`always @(*)`, `case`, `if-else`), dataflow modeling (`assign`), and structural gate-level modeling (hierarchical NAND-gate latch/flip-flop constructions).
* **Compatibility**: Native support for open-source simulators (**Icarus Verilog**, **Verilator**) and industrial EDA software (**Xilinx ISE** projects included via `.xise`).

---

## 📋 Experiment Catalog

| # | Experiment Name | Modeling Style | Design Files | Testbench |
| :-: | :--- | :--- | :--- | :--- |
| **01** | [Basic Logic Gates](exp01_basic_logic_gates/) | Dataflow / Behavioral | `logic_gates_design.v` | `logic_gates_testbench.v` |
| **02** | [Binary $\leftrightarrow$ Gray Converter](exp02_binary_to_gray_and_gray_to_binary_converter/) | Dataflow | `bin2gray.v`, `gray_to_binary.v` | `bin2gray_tb.v`, `gray_to_binary_tb.v` |
| **03** | [Half Adder](exp03_half_adder/) | Dataflow | `half_adder.v` | `half_adder_tb.v` |
| **04** | [Full Adder](exp04_full_adder/) | Dataflow | `full_adder.v` | `full_adder_tb.v` |
| **05** | [8-to-1 Multiplexer](exp05_8to1_multiplexer/) | Behavioral (`case`) | `mux8to1.v` | `mux8to1_tb.v` |
| **06** | [2-to-4 Decoder](exp06_2to4_decoder/) | Behavioral (`case`) | `decoder2to4.v` | `decoder2to4_tb.v` |
| **07** | [4-Bit Parallel Adder](exp07_parallel_adder/) | Structural / Behavioral | `parallel_adder_4bit.v` | `parallel_adder_4bit_tb.v` |
| **08** | [3-Bit Comparator](exp08_3bit_comparator/) | Behavioral | `comparator_3bit.v` | `comparator_3bit_tb.v` |
| **09** | [SR & D Latches](exp09_sr_latch_and_d_latch/) | Structural (NAND Gates) | `latches.v` | `latches_tb.v` |
| **10** | [SR & JK Flip-Flops](exp10_sr_flip_flop_and_d_flip_flop/) | Behavioral (Clocked) | `flip_flops.v` | `flip_flops_tb.v` |
| **11** | [4-Bit SISO Shift Register](exp11_siso_shift_register/) | Structural (NAND M/S D-FF) | `siso_reg.v` | `siso_reg_tb.v` |
| **12** | [4-Bit PISO Shift Register](exp12_piso_shift_register/) | Behavioral (Shift Reg) | `piso_reg.v` | `piso_reg_tb.v` |
| **13** | [4-Bit Up-Down Counter](exp13_up_down_counter/) | Behavioral (Synchronous) | `up_down_counter.v` | `up_down_counter_tb.v` |

---

## 📂 Repository Structure

```text
.
├── .gitignore
├── README.md
├── run_all.sh                                           <-- Automated bulk test & sim runner
├── exps.txt                                             <-- Official syllabus listing
│
├── exp01_basic_logic_gates/                            <-- Exp 01: All 7 primary logic gates
├── exp02_binary_to_gray_and_gray_to_binary_converter/  <-- Exp 02: 4-bit Binary <-> Gray
├── exp03_half_adder/                                   <-- Exp 03: 1-bit Half Adder
├── exp04_full_adder/                                   <-- Exp 04: 1-bit Full Adder
├── exp05_8to1_multiplexer/                              <-- Exp 05: 8:1 Mux with Select lines
├── exp06_2to4_decoder/                                 <-- Exp 06: 2:4 Active-High Decoder
├── exp07_parallel_adder/                               <-- Exp 07: 4-Bit Ripple Carry Adder
├── exp08_3bit_comparator/                              <-- Exp 08: 3-Bit Magnitude Comparator
├── exp09_sr_latch_and_d_latch/                         <-- Exp 09: Gate-Level NAND Latches
├── exp10_sr_flip_flop_and_d_flip_flop/                 <-- Exp 10: Edge-Triggered SR & JK FF
├── exp11_siso_shift_register/                          <-- Exp 11: Master-Slave NAND SISO
├── exp12_piso_shift_register/                          <-- Exp 12: Load/Shift PISO Register
└── exp13_up_down_counter/                              <-- Exp 13: 4-Bit Up-Down Counter
```

---

## 🛠 Toolchain & Prerequisites

To compile, simulate, and inspect waveforms, install the open-source EDA toolchain:

### Arch Linux / Manjaro:
```bash
sudo pacman -S iverilog gtkwave
```

### Ubuntu / Debian:
```bash
sudo apt update && sudo apt install -y iverilog gtkwave
```

### Fedora / RHEL:
```bash
sudo dnf install -y iverilog gtkwave
```

---

## ⚡ Quick Start

### 1. Run all 13 experiments with one command:
```bash
git clone https://github.com/punitr2007/verilog_exps.git
cd verilog_exps
chmod +x run_all.sh
./run_all.sh
```

### 2. Run an individual experiment:
```bash
cd exp05_8to1_multiplexer
iverilog -g2012 -o mux8to1.out mux8to1.v mux8to1_tb.v
vvp mux8to1.out
gtkwave dump.vcd
```

---

## 📖 Detailed Experiment Documentation

### Exp 01: Basic Logic Gates
* **Location:** [`exp01_basic_logic_gates/`](exp01_basic_logic_gates/)
* **Description:** Simulates all 7 basic logic gates simultaneously: AND, OR, NOT, NAND, NOR, XOR, and XNOR across all truth-table input combinations (`00`, `01`, `10`, `11`).
* **Signals:** `a`, `b` $\rightarrow$ `y_and`, `y_or`, `y_not`, `y_nand`, `y_nor`, `y_xor`, `y_xnor`.

---

### Exp 02: Binary to Gray & Gray to Binary Converter
* **Location:** [`exp02_binary_to_gray_and_gray_to_binary_converter/`](exp02_binary_to_gray_and_gray_to_binary_converter/)
* **Description:** Implements reversible 4-bit binary-to-reflected-Gray code and Gray-to-binary converters using bitwise XOR trees.
* **Formulas:**
  * Binary to Gray: $G_3 = B_3$, $G_2 = B_3 \oplus B_2$, $G_1 = B_2 \oplus B_1$, $G_0 = B_1 \oplus B_0$.
  * Gray to Binary: $B_3 = G_3$, $B_2 = B_3 \oplus G_2$, $B_1 = B_2 \oplus G_1$, $B_0 = B_1 \oplus G_0$.

---

### Exp 03: Half Adder
* **Location:** [`exp03_half_adder/`](exp03_half_adder/)
* **Description:** Single-bit arithmetic half adder producing Sum and Carry outputs.
* **Logic:** $\text{Sum} = a \oplus b$, $\text{Carry} = a \cdot b$.

---

### Exp 04: Full Adder
* **Location:** [`exp04_full_adder/`](exp04_full_adder/)
* **Description:** Cascaded 1-bit full adder supporting carry-in from preceding stages.
* **Logic:** $\text{Sum} = a \oplus b \oplus c_{in}$, $c_{out} = (a \cdot b) + (c_{in} \cdot (a \oplus b))$.

---

### Exp 05: 8-to-1 Multiplexer
* **Location:** [`exp05_8to1_multiplexer/`](exp05_8to1_multiplexer/)
* **Description:** 8-channel multiplexer with 3 select lines (`S[2:0]`) routing one of eight input data lines (`D[7:0]`) to output `Y`.
* **Features:** Safe default handling, parameterized vectors, and full channel sweep testbench.

---

### Exp 06: 2-to-4 Decoder
* **Location:** [`exp06_2to4_decoder/`](exp06_2to4_decoder/)
* **Description:** 2-bit binary decoder with 4 active-high decoded output lines (`Y[3:0]`).
* **Truth Table:** Activates exactly one output line matching the binary index of inputs `S1, S0`.

---

### Exp 07: 4-Bit Parallel Adder
* **Location:** [`exp07_parallel_adder/`](exp07_parallel_adder/)
* **Description:** 4-bit Ripple Carry Adder (RCA) adding two 4-bit vectors `A` and `B` with an initial carry `cin`, generating a 4-bit `sum` and final overflow `cout`.

---

### Exp 08: 3-Bit Magnitude Comparator
* **Location:** [`exp08_3bit_comparator/`](exp08_3bit_comparator/)
* **Description:** Compares two unsigned 3-bit vectors `A[2:0]` and `B[2:0]`.
* **Outputs:** 3 mutually exclusive flags: `A_gt_B` ($A > B$), `A_eq_B` ($A = B$), and `A_lt_B` ($A < B$).

---

### Exp 09: SR Latch & D Latch (NAND Gate-Level)
* **Location:** [`exp09_sr_latch_and_d_latch/`](exp09_sr_latch_and_d_latch/)
* **Description:** Pure structural implementation constructed from fundamental 2-input NAND gates (`my_nand2`).
* **Features:**
  * Active-low cross-coupled NAND SR latch.
  * Level-sensitive transparent D latch using steering NAND gates.
  * Complete verification of SET, RESET, MEMORY (HOLD), and safe recovery from the FORBIDDEN state (`S_bar = R_bar = 0`).

---

### Exp 10: SR Flip-Flop & JK Flip-Flop
* **Location:** [`exp10_sr_flip_flop_and_d_flip_flop/`](exp10_sr_flip_flop_and_d_flip_flop/)
* **Description:** Positive edge-triggered synchronous flip-flops.
* **Highlights:**
  * **SR Flip-Flop**: Validates SET, RESET, and HOLD on active clock edges.
  * **JK Flip-Flop**: Resolves the indeterminate condition by implementing the famous **Toggle state** ($J=1, K=1 \rightarrow Q_{next} = \bar{Q}$).

---

### Exp 11: 4-Bit SISO Shift Register (Structural NAND)
* **Location:** [`exp11_siso_shift_register/`](exp11_siso_shift_register/)
* **Description:** 4-bit Serial-In Serial-Out shift register built entirely out of gate-level primitives:
  * 2-input NAND (`my_nand2`) and 3-input NAND (`my_nand3`).
  * D-latches with asynchronous active-low reset.
  * Master-Slave D flip-flops (`d_ff_nand`).
  * Demonstrates bit-by-bit serial shifting across 4 clock periods without race conditions.

---

### Exp 12: 4-Bit PISO Shift Register
* **Location:** [`exp12_piso_shift_register/`](exp12_piso_shift_register/)
* **Description:** Parallel-In Serial-Out shift register supporting synchronous dual-mode operation:
  * **Load Mode (`load_shift = 0`):** Simultaneously latches all 4 parallel bits into the internal register.
  * **Shift Mode (`load_shift = 1`):** Serially shifts data out via LSB (`shift_reg[0]`), zero-padding from MSB.

---

### Exp 13: 4-Bit Synchronous Up-Down Counter
* **Location:** [`exp13_up_down_counter/`](exp13_up_down_counter/)
* **Description:** Synchronous 4-bit counter with active-high asynchronous reset and directional control:
  * When `up_down = 1`: Increments $0 \rightarrow 15 \rightarrow 0$.
  * When `up_down = 0`: Decrements $15 \rightarrow 0 \rightarrow 15$.

---

## 🚀 Bulk Execution (`run_all.sh`)

The repository includes a self-healing automation script [`run_all.sh`](run_all.sh) that:
1. Automatically traverses every directory from `exp01` through `exp13`.
2. Compiles every design and testbench using `iverilog -g2012`.
3. Executes the resulting binaries using `vvp`.
4. Creates uniform `dump.vcd` symlinks for single-click GTKWave viewing.

```bash
./run_all.sh
```

**Output Preview:**
```text
==================================================================
 DCS Lab Experiments (Verilog) - Bulk Compilation & Simulation   
==================================================================
[exp01_basic_logic_gates]
  ✔ Waveform generated: dump.vcd
[exp02_binary_to_gray_and_gray_to_binary_converter]
  ✔ Waveforms generated: bin2gray.vcd, gray_to_binary.vcd
...
[exp13_up_down_counter]
  ✔ Waveform generated: up_down_counter.vcd (symlinked to dump.vcd)
==================================================================
All 13 / 13 experiments compiled & simulated successfully!
==================================================================
```

---

## 👤 Author & Maintenance

* **Maintainer:** [punitr2007](https://github.com/punitr2007)
* **Repository:** [verilog_exps](https://github.com/punitr2007/verilog_exps)
* **Subject:** Digital Circuits and Systems (DCS) / Digital Design HDL Lab
