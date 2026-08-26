###############################################################################
# Created by write_sdc
# Wed Aug 26 01:21:17 2026
###############################################################################
current_design AsynFifo
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name w_clk -period 10.0000 [get_ports {w_clk}]
set_clock_transition 0.1500 [get_clocks {w_clk}]
set_clock_uncertainty 0.2500 w_clk
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_clk}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_rst_n}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {rd}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {w_data[0]}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {w_data[1]}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {w_data[2]}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {w_data[3]}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {w_data[4]}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {w_data[5]}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {w_data[6]}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {w_data[7]}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {w_rst_n}]
set_input_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {wr}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {empty}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {full}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_data[0]}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_data[1]}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_data[2]}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_data[3]}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_data[4]}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_data[5]}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_data[6]}]
set_output_delay 2.0000 -clock [get_clocks {w_clk}] -add_delay [get_ports {r_data[7]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {empty}]
set_load -pin_load 0.0334 [get_ports {full}]
set_load -pin_load 0.0334 [get_ports {r_data[7]}]
set_load -pin_load 0.0334 [get_ports {r_data[6]}]
set_load -pin_load 0.0334 [get_ports {r_data[5]}]
set_load -pin_load 0.0334 [get_ports {r_data[4]}]
set_load -pin_load 0.0334 [get_ports {r_data[3]}]
set_load -pin_load 0.0334 [get_ports {r_data[2]}]
set_load -pin_load 0.0334 [get_ports {r_data[1]}]
set_load -pin_load 0.0334 [get_ports {r_data[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {r_clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {r_rst_n}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rd}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_rst_n}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {wr}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {w_data[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.5000 [current_design]
set_max_fanout 18.0000 [current_design]
