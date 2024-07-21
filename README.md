# kind-labeler

A setup repository for the Ozone labeler service.

# Setup

1. Follow the [HOSTING.md](https://github.com/bluesky-social/ozone/blob/main/HOSTING.md) guide to install Docker CE
2. Install `make` with `apt-get update && apt-get install build-essentials`
3. Run `make firewall-setup` (one time only)
4. Run `make file-setup`
5. Edit all the files in the output to add passwords and signing key hex values
6. Run `make systemd-setup`
7. Run `make start`
8. Verify the setup by running `make status` and logging into [kind-labeler.bryan.town](https://kind-labeler.bryan.town)
