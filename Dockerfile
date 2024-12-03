# Étape 1 : Utiliser l'image de base Nginx
FROM nginx:alpine

# Étape 2 : Copier le fichier HTML dans le répertoire par défaut de Nginx
COPY ./index.html /usr/share/nginx/html/index.html

# Étape 3 : Exposer le port 80
EXPOSE 80

# Étape 4 : Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]

