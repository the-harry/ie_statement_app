# I&E statement app

## Stack

- `Ruby 3.3.0`
- `Rails 7.1.2`
- `Postgres 13.1-alpine`

## About

This project is created to manage Income & Expenditure statements, allowing users to create several reports and view it in a monthly basis.

## Getting started

```bash
# Before building the containers copy the .env.sample file to .env. Change any value if needed.
cp .env.sample .env

# Build and run the containers:
docker-compose build
docker-compose up

# To access the web container(another terminal):
docker-compose exec web bash

# To setup the project just run bin/setup` inside the container.
bin/setup

# To stop the project:
docker-compose down
```

The application is loaded by default on port 4000.

## Quality

We have rspec specs, rubocop and brakeman in this project, we also check zeitwerk loader. Please keep it tidy by running:

```bash
# Security
brakeman -A --color

# Loaders integrity
bin/rails zeitwerk:check

# Autofix ofenses
rubocop -A

# run all specs
rspec
```

PS: If possible run rubocop first, so if any autofix breaks the code, rspec will tell you(probably).

We also use SimpleCov with the min coverage of 80%, so if the coverage drops, the pipeline will break.
Coverage report can be found at `coverage/index.html`.


## FUTURE

- FIX DELETE PROMPT NOT WORKING
- ADD MONTHLY PAGINATION
- IMPROVE FE
- MOVE CALCULATIONS TO AN ASYNC APPROACH(workers||actioncable)
- USE PRESENTERS TO REMOVE LOGIC FROM VIEWS
- IMPROVE/ADD/REFAC SPECS
