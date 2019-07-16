# Local Development Setup

### Initial Setup

1. Build the containers with the command ```docker-compose up --build```
2. Create the rails db with the command ```docker-compose exec app rails db:create``` in a different terminal
3. Run the initial migrations with the command ```docker-compose exec app rails db:migrate RAILS_ENV=development``` in a different terminal

### Testing

1. Start the containers with ```docker-compose up```
2. Stop the containers with ```docker-compose down``` when you're done

<small>Followed guide from <https://auth0.com/blog/ruby-on-rails-killer-workflow-with-docker-part-1/#Development-Workflow>.</small>