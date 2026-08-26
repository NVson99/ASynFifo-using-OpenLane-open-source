
set ::env(DESIGN_NAME) "AsynFifo"
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(SDC_FILE)  "$::env(DESIGN_DIR)/src/AsynFifo.sdc"
set ::env(FP_PIN_ORDER_CSV) "$::env(DESIGN_DIR)/pin_order.cfg"
set ::env(CONFIG_FILE) "$::env(DESIGN_DIR)/config.tcl"
#clocks
set ::env(CLOCK_PORT) "w_clk"
set ::env(CLOCK_PERIOD) 10

#floorplan
set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 1000 1000"
set ::env(FP_CORE_UTIL) 0.40
set ::env(PL_TARGET_DENSITY) 0.40
#power
set ::env(VDD_NETS) [list vccd1]
set ::env(GND_NETS) [list vssd1]
#synthesis/cts
set ::env(SYNTH_STRATEGY) "AREA 1"
set ::env(RUN_CTS) 1
set ::env(CLOCK_TREE_SYNTH) 1
set ::env(MAX_FANOUT_CONSTRAINT) 18
set ::env(MAX_TRANSITION_CONSTRAINT) 0.5
#pdk library
set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"
set ::env(DESIGN_IS_CORE) 1
set ::env(QUIT_ON_MAGIC_DRC) 0
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(RUN_LVS) 1
set ::env(RUN_CVC) 1
# ===================== Multi-Corners =====================

 set ::env(STA_CORNERS) "tt ss ff sf fs"
# Bật phân tích timing ở nhiều corner
set ::env(RUN_SPEF_CORNERS) 1
set ::env(LIB_CORNER) "tt ss ff sf fs"