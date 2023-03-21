OPENVPN MULTIPROCESS DOCKER
===========================

A template for building a web app inside container which connected to an OpenVPN network. This template based on https://github.com/dperson/openvpn-client and utilize supervisord to manage the process

## How to setup vpn
1. create a `vpn` folder inside this folder, then copy your `.ovpn` config file inside it
2. its recommended to setup password file to avoid the password being logged into your console. steps:
  2.a Create a new empty file in `vpn` folder, for example `pass.txt`
  2.b Modify your `.ovpn` file by adding `askpass /vpn/pass.txt`. Notice that the path is the absolute path inside the container
3. OpenVPN would automatically detect this config file and use it when you started the container

## How to add new project
1. create a new folder inside this project
2. create a new supervisor config file. the minimum content is:
   ```
   # example_file.conf
   [program:your_app_name]
   command=/path/to/your/executable --or-whatever-options
   ```
3. copy or mount it into `/etc/supervisor/custom.conf.d/` folder
4. supervisord should automatically detect it and run the process the next time the container is restarted.
