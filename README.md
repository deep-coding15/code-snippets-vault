# 🏛️ Code Snippets Vault

Bienvenue dans mon coffre-fort de code ! Ce dépôt centralise mes extraits de code (snippets), configurations et scripts réutilisables pour accélérer mes développements au quotidien.

## 📂 Structure du Coffre-Fort

```text
code-snippets-vault/
├── 📂 docker/
│   ├── docker-compose.yml     # Orchestration de 2 services Spring Boot avec bases H2
│   ├── Dockerfile             # Build multi-stage ultra-léger pour Java 21 (~140 Mo)
│   └── clean-docker.sh        # Script de nettoyage complet du cache et des volumes
└── README.md
```

## 🚀 Contenu Phare

### 🐳 Docker & Spring Boot
Le dossier `docker/` contient une configuration prête à l'emploi pour l'environnement de développement :
* **Images optimisées** : Utilisation du JRE BellSoft Alpine pour réduire la taille des conteneurs.
* **Bases H2 indépendantes** : Chaque microservice possède son propre stockage persistant via les volumes Docker.
* **Orchestration intelligente** : Gestion de l'ordre de démarrage avec vérification de la santé des conteneurs (Healthcheck via Spring Boot Actuator).

### 🧹 Script de Nettoyage Docker
Pour purger rapidement l'environnement Docker après un plantage ou pour libérer de l'espace disque, exécutez le script présent dans `docker/` :

```bash
# Rendre le script exécutable (Linux/macOS)
chmod +x docker/clean-docker.sh

# Lancer le nettoyage
./docker/clean-docker.sh
```

## 🛠️ Comment utiliser ces Snippets dans votre IDE ?

Pour intégrer ces templates directement dans **IntelliJ IDEA** :
1. Allez dans `Settings` > `Editor` > `Live Templates`.
2. Créez un nouveau template (ex: `dcc-spring`).
3. Copiez-y le contenu du fichier `docker-compose.yml`.
4. Associez-le au contexte `YAML`.

---
💡 *Ce dépôt est mis à jour régulièrement au fil de mes découvertes et optimisations.*
