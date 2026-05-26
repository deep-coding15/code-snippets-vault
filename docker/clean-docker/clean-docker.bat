@echo off
echo [*] Suppression des images intermediaires casses...
docker image prune -f

echo [*] Nettoyage complet du systeme (conteneurs, reseaux, cache)...
docker system prune -f --volumes

echo [*] Suppression de tous les volumes Docker...
FOR /F "tokens=*" %%i IN ('docker volume ls -q') DO docker volume rm %%i 2>nul

echo [INFO] Nettoyage Docker termine avec succes !
pause
