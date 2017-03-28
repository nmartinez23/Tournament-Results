# Tournament Results Project

## Swiss-system style tournament app built with Python, PostgreSQL, Unit Testing, Vagrant and Virtual Box.

## Features

* Python module passes the included unit tests.
* Normalized tables with properly defined data dependencies, no redundant data and meaningful table names.
* Table columns have proper data types, meaningful names and properly define primary and secondary keys.
* Query parameters protect against SQL injection.

## Swiss Tournament Example - No elimination

* First round randomly pairs 16 players to play 8 games. Each pair will have a winner(1 point) and loser(0 points) as the result.
* Second round randomly pairs 8 players with 1 point to play 4 games. The other 8 players will pair to play 4 games.
* Third round pairs 4 players with 2 points to play 2 games. 8 players with 1 point will pair to play 4 games. The 4 players with 0 points will pair to play 2 games.
* Round four pairs 2 players with 3 points who will play for the championship. The other games consist of 6 players with 2 points, 6 players with 1 point and 2 players with 0 points.

## Test out the application locally

You can clone, fork or download the Zip file. You will need to download Python 2.7 at https://www.python.org/downloads.
Also install Vagrant and Virtual Box to create a virtual machine. You will need to have PostgreSQL installed as well.

* Once you have Vagrant running with commands 'vagrant up' and 'vagrant ssh', cd into /vagrant/tournament
* tournament.sql sets up the db schema. tournament.py provides functions to access to your db. tournament_test.py tests your functions in tournament.py
* You will need to use psql commands in the terminal. Please see the documentation manual at https://www.postgresql.org/docs/9.2/static/app-psql.html
* Set up the database from the command line with 'psql -f tournament.sql'
* To run and test your modules from the command line, use 'python tournament_test.py'
