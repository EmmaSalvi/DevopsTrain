# TPdevops

## On reprend du début : 

On supprime .git
On supprime .terraform + tous les fichiers dans provisions sauf les .tf et .tfvars
On supprime la repo (sur Eve)
On supprime les deux app sur Heroku
Les dev supprime leur dossier « devops » sauf les lead dev (moi)

Dans main.go on peut faire « go build » et « ./devops » = Server is running at 8080

On refait les terraform init/plan/apply dans le dossier provisions

On va installer et se connecter à Heroku si ce n’est pas déjà fait
Installer heroku avec brew : « brew install heroku/brew/heroku » dans le dossier
On se connecte avec : « heroku login »

On link notre code sur GitHub 
git init
git add .
git commit -m "first commit"
git remote add origin git@github.com:HerokuPEE/dev.git (on trouve cette ligne dans notre repository)

On crée le provider heroku, tfvars et variables.tf + gitignore 

On crée nos deux app
On crée la pipeline

On link Heroku/GitHub
heroku git:remote -a app-pee-s
git add .
git status
git commit -am "first commit"

(Je rajoute ma clé ssh sur GitHub si besoin)

On push sur GitHub : git push origin master
On push sur Heroku : git push heroku master

Plus simplement : git add . / git commit -am "xxx" / make push

## Heroku / staging to production

Notre app en staging est là, pas en prod
Dans la pipeline on envoie en prod notre app staging avec le bouton « Promote to production … » 

On peut supprimer le fichier docker compose et remplacer par une bdd Postgress sur Heroku (avec terraform)
Pour cela on rajoute l'addon Postgress sur l'app de staging
On créé les ressource database puis on terraform apply
Dans Heroku > app > settings > on a une nouvelle variable d'environement qu'on rajoute dans main.go
On crée une nouvelle bdd pour l'app de production de la même manière

On a crée 2 bdd pour staging et production

On rajoute un log dans main.go
On le push sur heroku master
On vérifie qu'il s'affiche dans les log de l'app en staging
Si oui on promote to production
Le code source est maintenant le meme en local, en staging, en production !
Well done !

## Nos fichiers : 
Handler = serveur http
Editor config = avoir les mêmes configuration pur les différents IDE des utilisateurs (avec un plugin)
Git ignore = ignore les fichiers pour un repository git (on oublie pas d’ajouter les terraform) 
Docker compose = permet de lancer un réseau local en local avec des containers Docker 
Go mod = initialise et lance les dépendances go (pour l’instant on en a pas mais Heroku en a besoin)
main.go = notre fichier go
Make file = simplifie certaines lignes de commande (penser à en rajouter un pour push sur Git + Heroku !)
Procfile = destiné pour Heroku

Provisions
Providers = on cache les variables dans la valeur + définir la variable + la mettre dans terraform.tfvars
