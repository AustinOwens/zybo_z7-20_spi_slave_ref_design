set fileList {
    "./zybo-z720-spi-ref-design"
    "./zybo-z720-spi-ref-design.xsa"
    "./*.dmp"
    "./*.log"
    "./.Xil"
}

foreach pattern $fileList {
    # Use glob to expand wildcards and get the list of matching files
    # Wrap it in a catch block to handle the case where no files match the pattern
    if {[catch {set files [glob -nocomplain $pattern]}]} {
        continue
    }

    foreach item $files {
        # Check if the item exists (glob ensures they do, but it's good practice to check)
        if {[file exists $item]} {
            # Delete the item
            file delete -force $item
        }
    }
}