#!/bin/bash

print_bytes() {
    if [ "$1" -eq 0 ] || [ "$1" -lt 1000 ]; then
        bytes="0 KB/s"
    elif [ "$1" -lt 1000000 ]; then
        bytes="$(echo "scale=0;$1/1000" | bc -l ) KB/s"
    else
        bytes="$(echo "scale=1;$1/1000000" | bc -l ) MB/s"
    fi

    echo "$bytes"
}

# print_bit() {
#     if [ "$1" -eq 0 ] || [ "$1" -lt 10 ]; then
#         bit="0 B"
#     elif [ "$1" -lt 100 ]; then
#         bit="$(echo "scale=0;$1*8" | bc -l ) B"
#     elif [ "$1" -lt 100000 ]; then
#         bit="$(echo "scale=0;$1*8/1000" | bc -l ) K"
#     else
#         bit="$(echo "scale=1;$1*8/1000000" | bc -l ) M"
#     fi

#     echo "$bit"
# }

INTERVAL=0.5
INTERFACES=`ip link | grep 'state UP' | cut -d ':' -f 2 | cut -c 2-`

declare -A bytes

for interface in $INTERFACES; do
    bytes[past_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
    bytes[past_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"
done

while true; do
    down=0
    up=0
    for interface in $INTERFACES; do
        bytes[now_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
        bytes[now_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"

        bytes_down=$(echo "scale=0;(${bytes[now_rx_$interface]}-${bytes[past_rx_$interface]})/$INTERVAL" | bc)
        bytes_up=$(echo "scale=0;(${bytes[now_tx_$interface]}-${bytes[past_tx_$interface]})/$INTERVAL" | bc)

        down=$(((( "$down" + "$bytes_down" ))))
        up=$(((( "$up" + "$bytes_up" ))))

        bytes[past_rx_$interface]=${bytes[now_rx_$interface]}
        bytes[past_tx_$interface]=${bytes[now_tx_$interface]}
    done

    printf " %7s    %7s\n" "$(print_bytes $up)" "$(print_bytes $down)"
    # echo "Download: $(print_bit $down) / Upload: $(print_bit $up)"

    sleep $INTERVAL
done
