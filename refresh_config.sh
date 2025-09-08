

sudo cp server_files/wg0.conf /etc/wireguard/wg0.conf

sudo wg-quick down wg0 && sudo wg-quick up wg0
