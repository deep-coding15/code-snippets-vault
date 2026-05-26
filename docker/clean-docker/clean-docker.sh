#!/bin/bash

# Vérifier si des conteneurs du projet sont en train de tourner
if [ "$(docker compose ps --format '{{.State}}' | grep -c 'running')" -gt 0 ]; then
    echo "⚠️  Des conteneurs sont actifs. Lancement d'un nettoyage sécurisé..."
    echo "[*] Libération du cache de build (BuildKit)..."
    docker builder prune -f
    echo "[*] Suppression des images de build intermédiaires..."
    docker image prune -f
    echo "✅ Nettoyage sécurisé terminé ! Vos conteneurs et bases H2 n'ont pas été touchés."
else
    echo "🛑 Aucun conteneur actif. Lancement du grand nettoyage à vide..."
    echo "[*] Suppression des conteneurs arrêtés et réseaux inutilisés..."
    docker system prune -f
    echo "[*] Suppression de TOUTES les images intermédiaires..."
    docker image prune -f
    echo "[*] Suppression de TOUS les volumes (Bases H2 incluses)..."
    docker volume rm $(docker volume ls -q) 2>/dev/null || true
    echo "✅ Coffre-fort Docker entièrement vidé et nettoyé !"
fi
