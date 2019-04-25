#!/bin/bash

# With Vivado project open, run:
# write_project_tcl <current path>/build.tcl -force

# And then
sed -i -e 's/\.\/\${_xil_proj_name_}/\.\/vivado_project/g' build.tcl
