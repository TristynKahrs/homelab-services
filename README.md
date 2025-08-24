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
2. Copy `.env.example` to `.env` and adjust values (`TZ`, `PUID`, `PGID`, `DOMAIN`, paths, etc.).
3. Create the directories referenced by `DATA_ROOT`, `MEDIA_ROOT`, and `DOWNLOADS_ROOT`.

## Running

**Checklist**

- [ ] Docker and Docker Compose installed
- [ ] `.env` configured
- [ ] Data directories created
- [ ] Start services
  ```bash
  docker compose up -d
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
  docker compose up -d
  ```
- Stop stack
  ```bash
  docker compose down
  ```

