# link courses
https://openclassrooms.com/fr/courses/4425076-decouvrez-le-framework-django/4630835-creez-un-nouveau-projet

# installation postgresql
https://www.youtube.com/watch?v=kM4TzE9Pzfc

# Postgresql Command
https://www.postgresqltutorial.com/postgresql-cheat-sheet/

# shell line
https://www.youtube.com/watch?v=fD7x8hd9yE4

# configuration
Server [localhost]
Database [postgres]
Port [5432]
Username [postgres]
password [admin]
calling [psql]

# packages
django
psycopg2
django-debug-toolbar

# command
$ virtualenv "name_venv" -p python3
$ . "name_venv"/bin/activate (Mac) or .\venvdjango\Scripts\activate (Win)
$ pip install django (version: $ python -m django --version)
$ django-admin startproject disquaire_project

## installing postgres and configure
$ pip install psycopg2 (for used postgres with django)
$ use pgAdmin 4 to connect server PostgreSql and create a database 'disquaire'

## do not work
$ postgres -D /usr/local/pgsql/data (run a server postgres in sqlshell)
$ createdb -O yourusername dbname (ex:$ createdb -O celinems disquaire)

## connect postgresql to django
$ configure settings.py in your projet with lines
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql', # on utilise l'adaptateur postgresql
        'NAME': 'disquaire', # le nom de notre base de donnees creee precedemment
        'USER': 'postgres', # attention : remplacez par votre nom d'utilisateur
        'PASSWORD': 'admin',# write your password
        'HOST': '',
        'PORT': '5432',
    }
}

## apply migrate and run your project in your folder contains manage.py file
$ python manage.py migrate
$ python manage.py runserver

## create app
$ django-admin startapp store

## process django MVT
Michel appuie sur "entrée". Cela génère une requête HTTP.
la requête arrive sur le serveur.
Django cherche dans le fichier urls.py le schéma correspondant à l'url.
Chaque schéma est associé à une vue.
La requête passe alors dans le fichier views.py,
plus précisément dans la méthode associée au schéma.
La vue exécute ce qui est demandé.
Elle interroge le modèle. La vue continue d'exécuter les instructions.
Elle fait appel au gabarit ou template adéquat pour formuler sa réponse.
Enfin, la vue renvoie une réponse HTTP correcte contenant le code HTML

## add template folder for views
$ mkdir store\templates (mkdir store\templates\store)

## add urls.py to app folder
$ echo > urls.py

## inclure les routes

