# 🏛️ Code Snippets Vault

Bienvenue dans mon coffre-fort de code ! Ce dépôt centralise mes extraits de code (snippets), configurations et scripts réutilisables pour accélérer mes développements au quotidien.

## 📂 Structure du Coffre-Fort

```text
code-snippets-vault/
├── 📂 docker/
│   ├── docker-compose.yml                          # Orchestration de 2 services Spring Boot avec bases H2
│   ├── Dockerfile                                  # Build multi-stage ultra-léger pour Java 21 (~140 Mo)
│   ├── 📂 dockerfile/
│   │   └── Dockerfile_spring_boot_distroless      # Dockerfile ultra-léger avec Google Distroless (sécurisé)
│   └── 📂 clean-docker/
│       ├── clean-docker.bat                        # Script nettoyage pour Windows
│       └── clean-docker.sh                         # Script nettoyage pour Linux/macOS
└── README.md
```

## 🚀 Contenu Phare

### 🐳 Docker & Spring Boot
Le dossier `docker/` contient une configuration prête à l'emploi pour l'environnement de développement :
* **Images optimisées** : Deux approches disponibles — Alpine (équilibré) et Distroless (ultra-sécurisé)
* **Bases H2 indépendantes** : Chaque microservice possède son propre stockage persistant via les volumes Docker.
* **Orchestration intelligente** : Gestion de l'ordre de démarrage avec vérification de la santé des conteneurs (Healthcheck via Spring Boot Actuator).

#### 📄 Fichiers Dockerfile Disponibles
- **Dockerfile** : Configuration standard multi-stage pour Java 21 (~140 Mo)
- **Dockerfile_spring_boot_distroless** : Dockerfile ultra-léger avec Google Distroless :
  - Base : `gcr.io/distroless/java21-debian12:nonroot` (minimal et sécurisé)
  - Aucun shell, package manager ou outils inutiles
  - Utilisateur non-root pré-configuré
  - Empreinte de sécurité réduite (moins de vulnérabilités potentielles)
  - Optimisation G1GC pour petits conteneurs

### 🧹 Script de Nettoyage Docker
Pour purger rapidement l'environnement Docker après un plantage ou pour libérer de l'espace disque, exécutez le script présent dans `docker/clean-docker/`.

Le script détecte automatiquement si des conteneurs sont actifs :
- **Mode sécurisé** : Si des conteneurs tournent => nettoyage du cache BuildKit et images intermédiaires (données sauvegardées)
- **Mode complet** : Si aucun conteneur actif => suppression totale des volumes, images et conteneurs arrêtés

**Sur Linux/macOS :**
```bash
# Rendre le script exécutable
chmod +x docker/clean-docker/clean-docker.sh

# Lancer le nettoyage
./docker/clean-docker/clean-docker.sh
```

**Sur Windows :**
```batch
docker\clean-docker\clean-docker.bat
```

## 🛠️ Comment utiliser ces Snippets dans votre IDE ?

Pour intégrer ces templates directement dans **IntelliJ IDEA** :
1. Allez dans `Settings` > `Editor` > `Live Templates`.
2. Créez un nouveau template (ex: `dcc-spring`).
3. Copiez-y le contenu du fichier `docker-compose.yml`.
4. Associez-le au contexte `YAML`.

---
💡 *Ce dépôt est mis à jour régulièrement au fil de mes découvertes et optimisations.*
