# Number of processor cores to use
set num_cores 12

# Close any projects that may be open
close_project

# Open project
open_project ./zybo-z720-spi-ref-design/zybo-z720-spi-ref-design.xpr

# Generate bitstream
update_compile_order -fileset sources_1

# Check if bitstream has been already generated
set run_status [get_property STATUS [get_runs impl_1]]

if { $run_status != "write_bitstream Complete!" } {
    launch_runs impl_1 -to_step write_bitstream -jobs $num_cores
	wait_on_run impl_1
}

# After generating bitstream or if it's already done, export .xsa
write_hw_platform -fixed -include_bit -force -file ./zybo-z720-spi-ref-design.xsa