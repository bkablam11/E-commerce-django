1. create venv and start project and app django
2. download and install postgresql and configure
user: postgres, pass: root
3. install psycopg2 in venv for connected django and pgAdmin
4. create database and files and changing in settings.py db.sqlite3 => psql
and apply migrate 
5. install django-debug-toolbar, go to doc: https://django-debug-toolbar.readthedocs.io/en/latest/installation.html
and configure django-toolbar
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls import url

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]

if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
        path(r'^__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns
6. add your app to settings.py => 'ecomapps.apps.EcomappsConfig'
7. add template\'your_apps' to gerer your design template => vue => url
8. create urls.py in your app and include it in your urls global in your project
9. error appear not problem because there is nothing in urls.py local
   . HttpResponse is use to print charfield in navigator web
10. create a view. # view is a fonction => a urls => template
11. create a model Entity-ass on paper and put into models.py
12. models.Model => heritage cree le lien entre la representation
    de la table en python et la table elle meme. On peut faire des tests avec des dict ou des listes
13. les relations => cours loic liber => danger, 
    les relations se declare dans la table qui contient la clé étrangère
    relare_name---> connaitre tous les albums d'un artist
14. ORM de django va lui meme creer ses databases dans postgres (ecomapps_album)
makemigration == le github de django 0001_initial.py => migrate
15. ajout d'info via l'ORM de django ( via la console itéractif de django :python ma
nage.py shell) , via formulaire, ..., via admin interface
    import models firstly, # from 'your apps'.models import Artist, Album
16. create enregistrement in the database for apply queryset => ORM gere tous
17. in founction __str__ return what you want; use queryset in view function
18. print result with HttpResponse <= iwith str .f'string 
19. les routes contiennent des regex url(r'^(?P<album_id>[0-9]+)/$', views.detail),
20. les views par defaut 
    def detail(request):
        pass
21. fo=unction of search and detail with urls
22. Download a good gabarit=> html interprete python and generete html => for your project
gabarit == variable + boucle => Analysis maquette + integrate static file + adapter html
link : https://startbootstrap.com/theme/
    create a folder for static like template
    move all files except html files
    by default .html  files is call from template and other static files like css, img, js
23. include, extend, block
{% extends 'ecomapps/base.html' %}
{% block content %}
  {% include 'ecomapps/list.html' with list_title='Nos derniers disques' %}
{% endblock %} 
    => charger le fichier base (a appelé) , au niveau de la section bloc (un restangle vide), inclure ecomapps/list.html
=> l'héritage: un gabarit enfant (other .html-- variable) peut hériter d'un gabarit parent (base -- fixed)
les parties qui se repete constitue la base (head, header, footer, partie centrale)
indiquer la zone enfant dans le gabarit parent, puis signifier le gabarit parent dans enfant
24. modify retun function in views for integrete template with from django.template import loader
load static contient des balise de gabarit qui vont nous permettre de generer du contenu
static genere une url vers les chemin passé en parametre 
    {%template%}, {{variable python}} object python interpreter par le navigateur
25. comment passer des variables au gabarit a partir de la vue=> reponse: via la methode render qui prend en 1er parametre un dict de var
26. les filtres de gabarit {% if forloop.counter|divisibleby:3 %}
27. les liens dans les gabarit, detail, generer html a par de python, fonction definit au prealable par django
gabarit => url rpend en parametre name="listing" de la view(urls)
    namespace=> regrouper les urls par application autour d'un nom commun
    include app_name = 'your_app' in url of apps, and in url project:  url(r'^ecomapps/', include('ecomapps.urls')),
    title = "Resultats pour la requête %s"%query
28. methode render()charger des gabarit, ajout de variable et envoi de reponse http  => return a view function, context => dict
with list_title='Tous nos disques' ??? passer en parametre le contenu d'une variable et afficher le titre de la list => renseigner les valeur de certaines variable
29. gabarit pour les error 404: demander (detail) non retrouver  et 500: une erreur s'est produite au server, Debug=False, Allow_host=['127.0.0.1]
code de status = 100 à 500
30. les formulaires de search_form.html create a barre de recherche pour album
31. le module des formaulaire qui permet de generer les formulaires et de valider les données qui sont recu dans la vue  
via from django import form , form.is_valid() => convertir en objet python, mieux use django.forms
32. gestion des messages d'erreur dans un gabarit ErrorList => self.as_divs()
33. les transaction => acide si une erreur de corrumption de la database apparait ne plus rien faire @transaction.atomic, try except
34. interface d'administration => powerful fort proprietaire and for user
35. les decorateurs @admin.register(Album) pour ajouter des options et personnaliser l'interface d'administration de django
http://www.formation-django.fr/framework-django/scaffolding/parametrage-avance-interface-admin.html
36. python => import random, string => "".join([random.choice(string.printable) for _ in range(24)]) => 
37. pip install whitenoise and dj_database_url, gunicorn
38. create dumps in apps for database => python manage.py dumpdata ecomapps > ecomapps\dumps\ecomapps.json
39. create Procfile, requirement.txt and push on git puis heroku app
