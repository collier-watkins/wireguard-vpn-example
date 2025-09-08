# Setup of Wireguard Server and Clients

Things you'll need:
1. Your network's public IP address
2. Your server device's local IP address.
3. Port forward your firewall's port 51820 to the server device's same port.

## Server
1. Install wireguard on whatever device your server will be on. For Debian/Ubuntu/Mint:

`sudo apt install wireguard`

2. Clone this repo (optional)
   
`git clone git@github.com:collier-watkins/wireguard-vpn-example.git`

3. Set permissions on the helper scripts if you want to run them

`sudo chmod +x generate_keys.sh`

4. Run `./generate_keys.sh` to generate two files: `publickey` and `privatekey`

5. Move those files to the `server_files` directory

`mv publickey privatekey server_files/`

6. Edit `wg0.conf` and replace the private key under `[Interface]` with your newly generated server private key.

7. Repeat steps 4 and 5 for each client you want. Feel free to rename the directories for the clients.

8. For each client config file, replace the private key under `[Interface]` with your generated private key for that client.
9. For each client config file, replace the public key under `[Peer]` with the **SERVER PUBLIC KEY**
10. For each peer in the server's config file, replace the public key with that client's associated public key.

For the configs to work, the client and server configurations for things like IP addresses, etc.. must agree.

11. When you're all done, copy the server config to the default location:

`sudo cp server_files/wg0.conf /etc/wireguard/wg0.conf`

Then run the server:

`sudo wg-quick up wg0`

## Client
1. Install the Wireguard app on whatever device you want to join the VPN.
2. Go back to your server device.

If your client device has a camera, run the `generate_qr_code_from_conf.sh` script. Example:

` ./generate_qr_code_from_conf.sh client_files/collier_phone/client.conf `

Scan that QR code with your wireguard app camera.

If your client device does not have a camera, you'll need to somehow copy that client.conf file to that device.

3. From a different network (phone service, someone else's wifi, etc..) try to use the wireguard app to connect to the server.

