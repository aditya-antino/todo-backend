# Multi-Container Todo Backend (Docker + Nginx + MongoDB)

This project is a multi-container CRUD backend system built with:

- Express.js (API)
- MongoDB (Database)
- Nginx (Reverse Proxy)
- Docker & Docker Compose
- GitHub Actions CI/CD

---

## Architecture

Client → Nginx (Port 80) → Express App (Private) → MongoDB (Private)

- Only Nginx exposes a port to host  
- App and DB are isolated in Docker network  
- MongoDB uses Docker Volume for persistence  

---

## Running the Application

Prerequisites:
- Docker
- Docker Compose

Run:

```bash
./deploy.sh

---

## Author
Aditya Mishra