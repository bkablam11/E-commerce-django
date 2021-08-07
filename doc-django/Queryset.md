#link 1
1. https://github.com/chrisdl/Django-QuerySet-Cheatsheet

2. https://github.com/divanov11/crash-course-CRM/tree/Part-7-Database-Queries/crm1_v7_database_queries

#link 2
https://docs.djangoproject.com/en/3.0/ref/models/querysets/

#link 3 aggregation
https://docs.djangoproject.com/en/3.2/topics/db/aggregation/

#link 4 relationship
https://hackernoon.com/django-orm-relationships-cheat-sheet-14433d6cf68c

#link 5 awesome cheatsheet
https://cheatography.com/tag/python/

# link 6 request
https://docs.djangoproject.com/fr/1.11/topics/db/queries/#field-lookups



## testing
#(1)Returns all customers from customer table
customers = Customer.objects.all()


#(2)Returns first customer in table
firstCustomer = Customer.objects.first()

#(3)Returns last customer in table
lastCustomer = Customer.objects.last()

#(4)Returns single customer by name
customerByName = Customer.objects.get(name='Peter Piper')

#(5)Returns single customer by name
customerById = Customer.objects.get(id=4)

#(6)Returns all orders related to customer (firstCustomer variable set above)
firstCustomer.order_set.all()

#(7)Returns orders customer name: (Query parent model values)
order = Order.objects.first() 
parentName = order.customer.name

#(8)Returns products from products table with value of "Out Door" in category attribute
products = Product.objects.filter(category="Out Door")

#(9)Order/Sort Objects by id
leastToGreatest = Product.objects.all().order_by('id') 
greatestToLeast = Product.objects.all().order_by('-id') 


#(10) Returns all products with tag of "Sports": (Query Many to Many Fields)
productsFiltered = Product.objects.filter(tags__name="Sports")

'''
(11)Bonus
Q: If the customer has more than 1 ball, how would you reflect it in the database?
A: Because there are many different products and this value changes constantly you would most 
likly not want to store the value in the database but rather just make this a function we can run
each time we load the customers profile
'''

#Returns the total count for number of time a "Ball" was ordered by the first customer
ballOrders = firstCustomer.order_set.filter(product__name="Ball").count()

#Returns total count for each product orderd
allOrders = {}

for order in firstCustomer.order_set.all():
	if order.product.name in allOrders:
		allOrders[order.product.name] += 1
	else:
		allOrders[order.product.name] = 1

#Returns: allOrders: {'Ball': 2, 'BBQ Grill': 1}


#RELATED SET EXAMPLE
class ParentModel(models.Model):
	name = models.CharField(max_length=200, null=True)

class ChildModel(models.Model):
	parent = models.ForeignKey(Customer)
	name = models.CharField(max_length=200, null=True)

parent = ParentModel.objects.first()
#Returns all child models related to parent
parent.childmodel_set.all()

#jointure
artist = "".join([artist['name' for artist un album['artists']]])

# load model

from ecomapps.models import Artist, Album

# insert into in table Artist

avec 1e table : Artist(name="Patrick Bruel").save() or Artist.objects.creates(name="Patrick Bruel")

entre 2 tables(ManytoMany) :  
1. francis = Artist.objects.creates(name="Patrick Bruel")   
2. album = Album.objects.creates(title="Sarbacane")
3. album.artists.add(francis)  # table liée au plurielle => +sieur Artist
4. retunr value of attribut=> productsFiltered = Product.objects.filter(tags__name="Sports")
Article.objects.select_related('reporter')

=> les jointure 
SELECT *
FROM Question JOIN Answer ON Question.id=Answer.question_id
WHERE Question.id=1
LIMIT 10

C’est exactement ce que fait select_related(). Le seul piège est que vous devez commencer par le modèle de réponse, plutôt que question, mais le résultat est le même:

answers = Answer.objects.filter(question_id=1).select_related() 
Main


__str__ : methode spéciale de python pour modifier l'affichage des objects. renvoi ?? (<QuerySet [<Artist: Artist object (10)>]>) =< methode GET renvoi un dict de l'object wsgi qui gere le server

5. print orm request to sql => str(Artist.objects.filter(name="Patrick Bruel").query)
----------------------
'SELECT "ecomapps_artist"."id", "ecomapps_artist"."name" FROM "ecomapps_artist" WHERE "eco
mapps_artist"."name" = Patrick Bruel'

https://davit.tech/django-queryset-examples/

database-------------------------------------------
id	first_name	last_name	is_active	date_joined
1	John	Doe	t	2020-03-18 14:20:32.02425+00
4	Jone	Doe	f	2020-02-18 14:20:32.02425+00
----------------------------------------------------

(1) How to get the SQL query from the QuerySet?

In: str(User.objects.all().query)
Out: 'SELECT "auth_user"."id", "auth_user"."password", "auth_user"."last_login", "auth_user"."is_superuser", "auth_user"."username", "auth_user"."first_name", "auth_user"."last_name", "auth_user"."email", "auth_user"."is_staff", "auth_user"."is_active", "auth_user"."date_joined" FROM "auth_user"'

(2) How to do AND operation? ☜
As an operation example let's limit(filter()) users whose is equal to 

qs1 = User.objects.filter(first_name="John", is_active=True)
the same thing we can do by chaining multiple filters:

qs2 = User.objects.filter(first_name="John").filter(is_active=True)
alternatively, we can apply & operator on two or more QuerySets:

qs3 = User.objects.filter(first_name="John") & User.objects.filter(is_active=True)
and finally, we can use the tool Q from .django.db.models

qs4 = User.objects.filter(Q(first_name="John") & Q(is_active=True)
It's worth to say that all QuerySet objects(qs1, qs2, qs3, qs4) will generate the same SQL query in the end. The comparison below proves that:

In: str(qs1.query) == str(qs2.query) == str(qs3.query) == str(qs3.query)
Out: True
In SQL terms, they are evaluated to:

SELECT "auth_user"."id", 
   ...
   "auth_user"."date_joined" 
FROM "auth_user" 
WHERE ("auth_user"."first_name" = John AND "auth_user"."is_active" = True)
SQL query, all without exceptions.

(3) How to do OR operation? ☜
Very basic example of operation will be filtering users whose is equal to John or Jane. We can achieve this with the help of Q:ORfirst_name

qs1 = User.objects.filter(Q(first_name="John") | Q(first_name="Jane"))
or applying | (pipe) operator on two or more querysets :

qs2 = User.objects.filter(first_name="John") | User.objects.filter(first_name="Jane")
It's true that and have identical SQL queries:qs1qs2

In: str(qs1.query) == str(qs2.query)
Out: True
and both produce:

SELECT "auth_user"."id", 
   ...
   "auth_user"."date_joined" 
FROM "auth_user" 
WHERE ("auth_user"."first_name" = John OR "auth_user"."first_name" = Jane)
SQL query.

(4) How to do a not equal filtering? ☜
As an example, we will select all the users except ones whose is equal to John:first_name

qs1 = User.objects.filter(~Q(first_name="John"))
another way of doing the same query is using the exclude() method:

qs2 = User.objects.exclude(first_name="John")
As you may guess, SQL queries are identical in this case too:

In: str(qs1.query) == str(qs2.query)
Out: True
and the produced SQL query is:

SELECT "auth_user"."id", 
   ...
   "auth_user"."date_joined" 
FROM "auth_user" 
WHERE NOT ("auth_user"."first_name" = John)

(5) How to do IN filtering? ☜
A typical example could be filtering users by the given list of IDs. Below is an example with the in expression being used:

qs = User.objects.filter(pk__in=[1, 4, 7])
SELECT "auth_user"."id", 
   ...
   "auth_user"."date_joined" 
FROM "auth_user" 
WHERE "auth_user"."id" IN (1, 4, 7)
In some cases it might be benefical to use in_bulk() method.
in_bulk(id_list=None, field_name='pk') takes a list of field values (id_list) and the field_name for those values, and returns a dictionary mapping each value to an instance of the object with the given field value. If id_list isn’t provided, all objects in the queryset are returned.
IMPORTANT! field_name must be a unique field, and it defaults to the primary key.
Example:

In: User.objects.in_bulk([1, 4, 7])
Out: {1: < User: John >, 4: < User: Jane >, 7: < User: Jemery >}
(6) How to do IS NULL or IS NOT NULL queries? ☜
As an example, we will select only those users whose is not specified(in other words it is NULL): first_name

qs = User.objects.filter(first_name__isnull=True)
SELECT ...
FROM "auth_user" 
WHERE "auth_user"."first_name" IS NULL
the opposite QuerySet:

qs = User.objects.filter(first_name__isnull=False)
SELECT ...
FROM "auth_user" 
WHERE "auth_user"."first_name" IS NOT NULL
So, takes either True or False, which correspond to SQL queries of IS NULL and IS NOT NULL, respectively. isnull

(7) How to do SQL “LIKE” equivalent queries? ☜
The SQL LIKE operator is used in a WHERE clause to search for a specified pattern in a column. There are two wildcards often used in conjunction with the LIKE operator:

% - The percent sign represents zero, one, or multiple characters
_ - The underscore represents a single character
We will cover different cases one by one.
The first case will be selecting users whose starts with Jo string:first_name

qs = User.objects.filter(first_name__startswith="Jo")
SQL equivalent:

SELECT ...
FROM "auth_user" 
WHERE "auth_user"."first_name"::text LIKE Jo%
now let's select those users whose ends with yan string:last_name

qs = User.objects.filter(last_name__endswith="yan")
SQL equivalent:

SELECT ...
FROM "auth_user" 
WHERE "auth_user"."last_name"::text LIKE %yan
To demonstrate the last example for the wildcard, we will select users whose contains oh string:%last_name

qs = User.objects.filter(last_name__contains="oh")
SELECT ...
FROM "auth_user" 
WHERE "auth_user"."last_name"::text LIKE %oh%
Unfortunatelly, there is no built-in tool for _(underscore wildcard). But, there is an alternative solution with the use of the regex lookup tool.

As an example, we will filter users whose matches D_e patterns, which means that it should start with the letter D then follow with any single character and end with the letter e: last_name

qs = User.objects.filter(last_name__regex=r"^D.e$")
SELECT ...
FROM "auth_user" 
WHERE "auth_user"."last_name"::text ~ ^D.e$
As you can see, it's being converted to a regular expression syntax that is defined in the database backend.

All the tools in this section also support case insensitive lookups. Check startswith, istartswith, endswith, iendswith, contains, icontains, regex, iregex in the official docs for the details.

(8) How to do comparison(>, >=, <, <=) operations? ☜
Getting all users, whose is greater than(>) 3 integer: id

qs = User.objects.filter(id__gt=3)
SELECT ...
FROM "auth_user" 
WHERE "auth_user"."id" > 3
Getting all users, whose is less than(<) 4 integer: id

qs = User.objects.filter(id__lt=4)
SELECT ...
FROM "auth_user" 
WHERE "auth_user"."id" < 4
As you may guess, gt and lt are short aliases for greater than and less than, respectively.

And for doing greater than or equal or less than or equal lookups we just have to add e - equal at the end of the alias. So, will be converted to and will be converted to . More on this here. gte>=lte<=

(9) How to do BETWEEN operation? ☜
To implement operation we are going to use another Django's tool called range. And we are going to filter users whose (datetime) value is in a specific date time range. Before building the QuerySet let's prepare two timezone aware datetime objects: BETWEENdate_joined

import pytz
from django.utils import timezone

start = timezone.make_aware(timezone.datetime(year=2019, month=1, day=1), pytz.utc)
end = timezone.make_aware(timezone.datetime(year=2019, month=12, day=31), pytz.utc)
the QuerySet:

qs = User.objects.filter(date_joined__range=[start, end])
SQL equivalent:

SELECT ...
FROM "auth_user" 
WHERE "auth_user"."date_joined" BETWEEN 2019-01-01 00:00:00+00:00 AND 2019-12-31 00:00:00+00:00
FYI, you can use range anywhere you can use BETWEEN in SQL queries - for dates, numbers and even characters. Note that the end of the range is inclusive.

(10) How to LIMIT the number of results in queryset? ☜
To implement SQL’s LIMIT and OFFSET clauses we should use a subset of Python’s array-slicing syntax on a QuerySet object. The example below returns the first 10 users(LIMIT 10):

qs = User.objects.all()[:10]
SQL equivalent:

SELECT ...
FROM "auth_user" 
LIMIT 10
tenth through twentieth users(LIMIT 10 OFFSET 10):

qs = User.objects.all()[10:20]
SELECT ...
FROM "auth_user" 
LIMIT 10 OFFSET 10
At first glance you might think that this type of LIMIT OFFSET operations force to evaluate the QuerySet. But in general, slicing returns a new QuerySet object - it doesn’t evaluate the query. As we've noted at the beginning of this article, slices evaluate a QuerySet only if we use them with the step parameter. Both examples above are not evaluated - new QuerySets are being returned instead. As an example of slicing with the step could be returning a list of every second object of the first 10 users:

list_of_every_second = User.objects.all()[:10:2]
SELECT ...
FROM "auth_user" 
LIMIT 10
QuerySet for this operation is the same as for LIMIT 10 one above, but immediate evaluation and additional post-processing happened in this case in order to return every second object from the list of 10 objects.

To retrieve a single users rather than a list, use an index instead of a slice. For example, this returns the first User in the database:

In: User.objects.all()[0]
Out: < User: John >
SQL equivalent:

SELECT ...
FROM "auth_user" 
LIMIT 1
Note, that this approach will raise IndexError if there are no rows in the database.

It's important to note that negative indexing (i.e. ) is not supported on QuerySets.User.objects.all()[-1]

The implemenaion of slicing/indexing is written inside of method that you can find in class located in module.__getitem__QuerySetdjango.db.models.query

(10) How to ORDER results with QuerySets? ☜
To order a QuerySet you need to use the order_by() method. Additionally, you should pass the field(s) that are going to be used in sorting to that method:

qs = User.objects.order_by('date_joined')
SQL equivalent:

SELECT ...
FROM "auth_user" 
ORDER BY "auth_user"."date_joined" ASC
Query will return the list of users ordered by field ascending. We can pass as many fields as we need, also, adding the (dash) at the beginning of the field will order results in descending order. Example: date_joined-

qs = User.objects.order_by('date_joined', '-first_name')
SQL equivalent:

SELECT ...
FROM "auth_user" 
ORDER BY "auth_user"."date_joined" ASC,
         "auth_user"."first_name" DESC
reverse() method will reverse the existing order of QuerySet. Calling second time will restore the ordering back to the normal direction:reverse()

qs = User.objects.order_by('date_joined', '-first_name').reverse()
SELECT ...
FROM "auth_user" 
ORDER BY "auth_user"."date_joined" DESC,
         "auth_user"."first_name" ASC
In [1]: qs1 = User.objects.order_by('date_joined')
In [2]: qs2 = User.objects.order_by('date_joined').reverse().reverse()
In [3]: str(qs1.query) == str(qs2.query)
Out [3]: True
To order randomly, use like below:'?'

qs = User.objects.order_by('?')
SELECT ...
FROM "auth_user" 
ORDER BY RANDOM() ASC
(11) How to get a single object from QuerySet? ☜
The first approach is to use indexing as we used in the LIMIT section above:

In: User.objects.all()[0]
Out: < User: John >
Similiar QuerySet we can construct using the get() method. method returns the object matching the given lookup parameters, and raises exception if there is no match. It raises exception if more than one object was found. Example:get()DoesNotExistMultipleObjectsReturned

In: User.objects.get(pk=1)
Out: < User: John >
Also, If you expect a QuerySet to return a single row, you can use without any arguments.get()

There are 4 other handy methods that exist to help us when we want to get a single row/objects with some conditions.

Indexing and get() approaches are "alarmic" in some cases and we might want to get the object if it exists, or if it does not exist without catching any exceptions. And the first() method is very beneficial for that case:None

user = User.objects.order_by('date_joined', '-first_name').first()
the equivalent example using indexing:

try:
    user = User.objects.order_by('date_joined', '-first_name')[0]
except IndexError:
    user = None
The second method is the last(), which works like , but returns the last object in the QuerySet:first()

user = User.objects.order_by('first_name').last()
user = User.objects.order_by('first_name').reverse().first()
SQLs for both queries will be the same.

It's worth to mention 2 other methods. latest(), that returns the latest object in the table based on the given field(s) and earliest() that works the same way but the opposite direction.

user = User.objects.latest('date_joined', '-first_name')
SELECT ...
FROM "auth_user" 
ORDER BY "auth_user"."date_joined" DESC,
         "auth_user"."first_name" ASC
Like , and raise if there is no object with the given parameters. As mentioned in the official docs, earliest() and latest() exist purely for convenience and readability.get()earliest()latest()DoesNotExist

(12) Bonus Tip! ☜
If you install and plug django_extensions package to your project, you can output SQL queries in shell without manually printing them. There is a different shell command with special option(argument) for that:

$ python manage.py shell_plus --print-sql
>>> User.objects.first()
SELECT "auth_user"."id",
       "auth_user"."password",
       "auth_user"."last_login",
       "auth_user"."is_superuser",
       "auth_user"."username",
       "auth_user"."first_name",
       "auth_user"."last_name",
       "auth_user"."email",
       "auth_user"."is_staff",
       "auth_user"."is_active",
       "auth_user"."date_joined"
  FROM "auth_user"
 ORDER BY "auth_user"."id" ASC
 LIMIT 1
Execution time: 0.011151s [Database: default]
Note that in project settings must be set to .DEBUGTrue

You can also specify configuration option in settings to omit the above command-line option:SHELL_PLUS_PRINT_SQL

# will print SQL queries in shell_plus
SHELL_PLUS_PRINT_SQL = True

Conclusion ☜
The QuerySet API is very big and there are lot's of other tools that we will cover in different posts. So keep subscribed to not miss them.

# methode filter prnit all items in the columns
order_by[-created_at] => order by decroissant limit with slicing [:11]
https://youtu.be/8VC62i_WI3w
https://docs.djangoproject.com/en/dev/topics/db/queries/#retrieving-specific-objects-with-filters
Reserved.objects.filter(client=client_id).order_by('check_in').reverse() 



use f-string => 
	ocean_description = "deep blue"
	print(f"The ocean is {ocean_description} today")

# print query in html
http://www.learningaboutelectronics.com/Articles/How-to-connect-to-and-print-out-data-from-a-database-in-Django.php

from django.http import HttpResponse 
from . models import Students 
def index(request): 
	allstudents= Students.objects.all() 
	html= ' ' 
	for student in allstudents: 
		html += str(student.id) + '- ' + student.firstname + ' ' + student.lastname + ': ' + student.email +'<br>' 
		return HttpResponse(«<h1>» + html + «</h1>»)

HttpResponse(), cela ne fonctionnerait pas car ce code crée un Queryset. HttpResponse, avec des balises HTML, accepte uniquement les chaînes.

methode join() de python
La méthode prend tous les éléments dans un itérable et les joint en une chaîne.join()

Une chaîne doit être spécifiée comme séparateur.
Syntaxe => string.join(iterable)

query = request.GET.get('query') => renvoi tous les arguments passé à url

