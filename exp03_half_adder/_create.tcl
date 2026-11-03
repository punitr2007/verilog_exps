project new "exp03_half_adder.xise"
project set family "Artix7"
project set device "xc7a100t"
project set package "csg324"
project set speed "-3"
xfile add "half_adder_tb.v"
xfile add "half_adder.v"
project close
