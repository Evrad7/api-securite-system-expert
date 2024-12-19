# Installation de Tyk-Gateway sur le port 8080

**Commande pour lancer Tyk Gateway avec docker:**

```bash
docker run -it -d --name  tyk-gateway -p 8080:8080 evrad7/ms2d5-tyk
```

**Vérification du succès de l’installation :**

```bash
  curl localhost:8080/hello
```

Le résultat devrait être similaire à cette image
![installation tyk réussie ](installation_tyk_reussie.png)

## Ajout une url pour la recherche

-> Définir l'URL dans le fichier JSON
On crée une nouvelle route (par exemple /search) qui accepte une requete avec un parametre de requête (query parameter) nomme query.

-> Configurer une réponse statique
Utilisons la fonctionnalite mock_response de Tyk pour répondre avec une reponse arbitraire en JSON.

-> Documenter la route dans OpenAPI
Ajoute la documentation pour la nouvelle route, y compris les paramètres et la structure de la réponse.


# Configuration de Keycloak avec Docker et PostgreSQL
Une configuration de Keycloak pour le développement et la production.

## Guide

### Télécharger et construire les dernières versions des images
```docker-compose build --pull --no-cache```

## Démarrer Docker Compose en mode détaché :

### Pour le développement
```docker compose up -d```

### Pour la production
Créez un fichier `.env.prod` et collez le code ci-dessous :
```
SERVER_NAME=example.com

KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=admin

POSTGRES_VERSION=14.5
POSTGRES_DB=keycloak
POSTGRES_USER=keycloak
POSTGRES_PASSWORD=keycloak
```
Assurez-vous de remplacer ```example.com``` par votre nom de domaine réel et de définir les valeurs de 
```KEYCLOAK_ADMIN, KEYCLOAK_ADMIN_PASSWORD, POSTGRES_DB, POSTGRES_USER, POSTGRES_PASSWORD``` par des valeurs cryptographiquement sécurisées et aléatoires.

Ensuite, exécutez :
```docker compose -f docker-compose.yml -f docker-compose.prod.yml --env-file .env.prod up -d
