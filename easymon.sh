#!/bin/bash

os=$(uname -o)
architecture=$(uname -m)
kernelrelease=$(uname -r)
internalip=$(hostname -I)
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)

/bin/cp index.html.samp index.html

cat << EOF >> index.html
<div class="style9" align="center">OS  :  $os</div>
<div class="style9" align="center">Architecture  :  $architecture</div>
<div class="style9" align="center">Kernelrelease  :  $kernelrelease</div>
<div class="style9" align="center">internalip  :  $internalip</div>
<div class="style9" align="center">nameservers  :  $nameservers</div>
<div class="style9" align="center">loadaverage  :  $loadaverage</div>
<div class="style9" align="center">tecuptime  :  $tecuptime</div>
</html>
EOF
