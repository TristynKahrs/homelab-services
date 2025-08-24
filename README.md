# Homelab Services

Docker Compose configuration for self-hosting core services on a home server.

## Included Services
- **Traefik** – reverse proxy and HTTPS termination
- **Filebrowser** – simple file management & WebDAV
- **AdGuard Home** – DNS with ad-blocking
- **WireGuard** – VPN for remote access
- **Borgmatic** – encrypted backups
- **Portainer** – Docker UI
- **Watchtower** – automatic image updates

## Prerequisites
- Docker Engine and Compose plugin
- Linux host with necessary ports open (53, 80, 443, 3000, 9000, 51820/udp)
- Optional: domain pointing to your LAN for Traefik routes

## Setup
1. Clone the repository
   ```bash
   git clone <repo-url>
   cd homelab-services
   ```
2. Initialize environment and data directories
   ```bash
   make init
   ```
3. Edit `.env` and adjust values (`TZ`, `PUID`, `PGID`, `DOMAIN`, paths, etc.).

## Running

**Checklist**

- [ ] Docker and Docker Compose installed
- [ ] `.env` configured
- [ ] Data directories created
- [ ] Start services
  ```bash
  make up
  ```
- [ ] View logs
  ```bash
  make logs
  ```
- [ ] Visit services through Traefik:
  - https://traefik.${DOMAIN}
  - https://files.${DOMAIN}
  - https://portainer.${DOMAIN}
- [ ] Complete AdGuard Home setup at `http://<host>:3000`
- [ ] Configure WireGuard clients using files in `${DATA_ROOT}/wireguard`

## Maintenance
- Update images
  ```bash
  docker compose pull
  make up
  ```
- Stop stack
  ```bash
  make down
  ```

## Notes
- Traefik's dashboard is disabled by default. If you enable it with `--api.dashboard=true`, ensure it is only accessible over VPN or protected with authentication.

