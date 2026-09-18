# Firewall Automation Lab

A free, self-hosted DevOps + network security lab that uses **Ansible** to configure a Linux **nftables** firewall inside a disposable **Docker** container, then verifies the firewall automatically with **GitHub Actions**.

## What this project demonstrates

- Infrastructure/configuration as code with Ansible
- Linux firewall management with nftables
- Safe testing inside a disposable Docker container
- Idempotent automation
- Automated CI verification with GitHub Actions
- No cloud infrastructure required

## Architecture

```text
Developer
   |
   | git push
   v
GitHub
   |
   v
GitHub Actions
   |
   +--> Build Docker test image
   |
   +--> Start disposable Debian container
   |
   +--> Run Ansible playbook
              |
              v
         nftables.conf
              |
              v
       Linux nftables firewall
              |
              v
        DROP TCP/8080
   |
   +--> Start test web server on :8080
   |
   +--> curl localhost:8080
              |
              v
        blocked = CI passes
