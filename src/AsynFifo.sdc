set_units -time ns -capacitance uf -resistance ohm -frequency hz
set_units -current ma -voltage v -power mw -temperature c
set_operating_conditions -name "typical" -voltage 1.0 -temperature 25
#primary clocks
create_clock -name w_clk -waveform {0 5.0} -period 10 [get_ports w_clk]
create_clock -name r_clk -waveform {0 7.0} -period 14 [get_ports r_clk]
# clock groups
set_clock_groups -asynchronous \
-group [get_clocks w_clk] \
-group [get_clocks r_clk]
set_clock_uncertainty -setup 0.5 -hold 0.5 [get_clocks w_clk]
set_clock_uncertainty -setup 0.5 -hold 0.5 [get_clocks r_clk]
set_clock_latency -source 0.5 -early [get_clocks w_clk]
set_clock_latency -source 0.5 -early [get_clocks r_clk]
set_clock_latency -source 0.5 -late [get_clocks w_clk]
set_clock_latency -source 0.5 -late [get_clocks r_clk]
set_clock_transition -rise 0.5 -fall 0.6 [get_clocks w_clk]
set_clock_transition -rise 0.5 -fall 0.6 [get_clocks r_clk]
#input/output delay constraints
set_input_delay -clock w_clk -max 1.0 -min 0.2 [get_ports {wr w_data[*]}]
set_input_delay -clock r_clk -max 1.0 -min 0.2 [get_ports rd]
set_output_delay -clock w_clk -max 1.0 -min 0.2 [get_ports full]
set_output_delay -clock r_clk -max 1.0 -min 0.2 [get_ports {r_data[*] empty}]
#system interface constraints
set_input_transition -rise 0.5 -fall 0.6 [get_ports all_inputs]

set_load 0.5 [get_ports all_outputs]
#design rule constraints
set_max_transition 1.0 [current_design]
set_max_capacitance 0.5 [current_design]
set_max_fanout 16 [current_design]

# asynchronous constraints
set_false_path -from [get_ports w_rst_n] -to [get_ports r_rst_n]
set_false_path -from [get_ports r_rst_n] -to [get_ports w_rst_n]

