# Follow instructions here to prepare: https://github.com/bluesky-social/ozone/blob/main/HOSTING.md
# make sure to install Docker CE

# to set up from scratch:
# 1. make file-setup
# 2. replace all the password env values
# 3. make systemd-setup
# 4. make start
# 5. make status

.PHONY: file-setup
file-setup:
	sudo mkdir -pv /ozone/postgres
	sudo mkdir -pv /ozone/caddy/data
	sudo mkdir -pv /ozone/caddy/etc/caddy
	sudo cp Caddyfile /ozone/caddy/etc/caddy/Caddyfile
	sudo cp postgres.env /ozone/postgres.env
	sudo cp ozone.env /ozone/ozone.env
	sudo cp ozone-compose.yaml /ozone/compose.yam
	sudo cp ozone.service /etc/systemd/system/ozone.service

.PHONY: update-compose
update-compose:
	curl https://raw.githubusercontent.com/bluesky-social/ozone/main/service/compose.yaml > ozone-compose.yaml

.PHONY: systemd-setup
systemd-setup:
	sudo cp ozone.service /etc/systemd/system/ozone.service
	sudo systemctl daemon-reload
	sudo systemctl enable ozone

.PHONY: start
start:
	sudo systemctl start ozone

.PHONY: restart
restart:
	sudo systemctl restart ozone

.PHONY: status
status:
	sudo systemctl status ozone
	sudo docker ps

.PHONY: stop
stop:
	sudo systemctl start ozone

# run locally
.PHONY: run
run:
