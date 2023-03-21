OPENVPN MULTIPROCESS DOCKER
===========================

A template for building a web app inside container which connected to an OpenVPN network. This template based on https://github.com/dperson/openvpn-client and utilize supervisord to manage the process

## How to setup vpn
1. prepare the vpn file
2. encode it into base64 `cat example.conf | base64`
3. enter the result into `VPN_CONFIG_FILE_CONTENT` inside `.env` file. see `.env.example`

## How to add new project
1. create a new folder inside this project
2. create a new supervisor config file. the minimum content is:
   ```
   # example_file.conf
   [program:your_app_name]
   command=/path/to/your/executable --or-whatever-options
   ```
3. copy or mount it into `/etc/supervisor/custom.conf.d`
4. supervisord should automatically detect it and run the process the next time the container is restarted.
