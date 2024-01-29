# Source first script and check for errors
if {[catch {source ./1_build-zybo-z720-spi-ref-design.tcl} errmsg]} {
    puts "Error in 1_build-zybo-z720-spi-ref-design.tcl: $errmsg"
	return -code error
}

# Source second script and check for errors
if {[catch {source ./2_generate-bitstream.tcl} errmsg]} {
    puts "Error in 2_generate-bitstream.tcl: $errmsg"
	return -code error
}