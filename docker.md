# Local Development Setup
1. Install Docker Desktop <https://www.docker.com/products/docker-desktop>


2. Build the project docker container with the command :
```
docker build -t perfectparty .
```

3. Run the project docker container with interactive terminal with the command:
```
docker run -it perfectparty /bin/bash
```

#Local Development
```
docker-compose up (start containers)
docker-compose down (close containers)
docker-compose exec app rails db:create (create initial db)
docker-compose exec app rails db:migrate RAILS_ENV=development (run migration)
```

<small>Followed guide from <https://auth0.com/blog/ruby-on-rails-killer-workflow-with-docker-part-1/#Development-Workflow>.</small>