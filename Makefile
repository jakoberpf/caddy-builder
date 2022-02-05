install:
	@wget https://golang.org/dl/go1.16.3.linux-amd64.tar.gz
    @tar -C /usr/local -xzf go1.16.3.linux-amd64.tar.gz
	@curl -1sLf 'https://dl.cloudsmith.io/public/caddy/xcaddy/gpg.key' | sudo apt-key add -
	@curl -1sLf 'https://dl.cloudsmith.io/public/caddy/xcaddy/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-xcaddy.list
    @apt update
    @apt install xcaddy
    @echo 'PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    @exec bash
    @echo $PATH

build: install
	@xcaddy build --with github.com/caddy-dns/cloudflare