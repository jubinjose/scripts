rem -- map a drive
net use Y: \\network_name_of_machine\ddrive$ /persistent:YES /user:jubin jubinspassword /y
rem -- delete the mapped drive
net use y: /delete