#!/bin/bash
echo "[*] Suppression des images intermédiaires cassées..."
docker image prune -f

echo "[*] Nettoyage complet du système (conteneurs, réseaux, cache)...
docker system prune -f --volumes

echo "[*] Suppression de tous les volumes Docker..."
docker volume rm $(docker volume ls -q) 2>/dev/null || true

echo "[INFO] Nettoyage Docker terminé avec succès !"
