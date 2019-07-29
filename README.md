# Perfect Party

Our "Perfect Party" application was built primarily with Ruby on Rails and PostgreSQL, and fully encompasses the party planning process for the business. In total, we implemented 65 user interfaces (Create, Edit, List and Detail views for each of the 16 chosen entities, as well as an event search view), developed complex user interfaces like searching for upcoming events, created responsive styling with CSS and Bootstrap, and added dynamic error checking to multiple create and edit views. 

## Local Setup

1. Ensure Ruby version 2.6.3, Rails 5.2.3 and PostgreSQL are installed locally.
2. Run ```rails db:setup``` to initialize the PostgreSQL database and fill with default values.
3. Run ```rails s``` to start the application locally.
4. Navigate to <http://localhost:3000/> to use the application.

## Setup with Docker

1. Ensure Docker Desktop is installed locally and is running.
2. In ```config/database.yml```, change line 23 from ```host: localhost``` to ```host: db```.
2. Build the application and database containers with the ```docker-compose build``` command.
3. Start the application with ```docker-compose up```.
4. Run ```docker-compose exec app rails db:setup``` in a different terminal to initialize the PostgreSQL database and fill with default values.
6. Navigate to <http://localhost:3000/> to use the application.
