# 💧 Water Tank Controller using Verilog

## 📌 Project Description

This project implements an automatic Water Tank Controller using Verilog HDL.

The system monitors the water level inside a tank and automatically
controls a water pump.

The pump is turned ON when the tank is empty, low, or at medium level,
provided that a water source is available.

When the tank becomes full, the pump is automatically turned OFF.

## ⚙️ Features

- Automatic water-level monitoring
- Automatic pump control
- Four water-level states
- Water-source availability detection
- Reset functionality
- Verilog testbench
- VCD waveform generation
- Icarus Verilog simulation
- GTKWave waveform analysis

## 🌊 Water Level Encoding

| Water Level | Encoding |
|---|---|
| Empty | 00 |
| Low | 01 |
| Medium | 10 |
| Full | 11 |

## 🚰 Source Availability

| Source | Meaning |
|---|---|
| 0 | Water source unavailable |
| 1 | Water source available |

## 💧 Pump Logic

| Water Level | Source | Pump |
|---|---|---|
| Empty | Available | ON |
| Low | Available | ON |
| Medium | Available | ON |
| Full | Available | OFF |
| Empty | Not Available | OFF |
| Low | Not Available | OFF |
| Medium | Not Available | OFF |
| Full | Not Available | OFF |

## 📂 Project Structure

```text
water-tank-controller/
│
├── water_tank_controller.v
├── water_tank_controller_tb.v
└── README.md
