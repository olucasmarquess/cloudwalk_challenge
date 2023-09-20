# Quake Log Parser

### Overview

Quake Log Parser is a Ruby on Rails application that parses game logs from Quake 3 Arena. The application organizes game data into matches, collects kill statistics, and generates detailed reports. It's built to run in a Dockerized environment, making it easy to set up and deploy.

### Features
- Log Parsing: Efficiently parses Quake 3 Arena log files.
- Match Reports: Generates detailed reports for each match.
- Player Rankings: Keeps track of player performance and rankings.
- Cause of Death Analysis: Aggregates data on the causes of player deaths in each match.

## Setup
Make sure you have Ruby on Rails installed on your system.

### Installing using Docker
Run the following command to install the project dependencies:

Inside folder Run to build the project

```bash
docker compose build
```

### Database configuration
Make sure you have correctly configured the database information in the `config/data_base.yml` file.

Build the application
```bash
docker compose up --build
```

```bash
docker compose run web rake db:create db:migrate
```

Start the application
```bash
docker compose up
```
Stop the application
```bash
docker compose down
```

### Installing without Docker
Run the following command to install the project dependencies:

Inside folder Run to build the project

```bash
bundle install
```

```bash
rake db:create db:migrate
```

```bash
bundle exec rails s -p 3000 -b 0.0.0.0
```

### Usage
#### Generate Match Report
``` rake quake_report:generate ```

This will generate a CSV report in the root directory, containing details of each match.

#### Generate Deaths by Cause Report
This is part of the quake_report:generate task and will create a separate CSV file that contains aggregated data on causes of deaths for each match.

### Database Queries in Ruby

Collecting Death Data
To collect data on player deaths, you might use queries like:

### Fetch all deaths in a specific match
``` deaths = Death.where(match_id: some_match_id) ```

### Fetch all deaths caused by a specific player
``` deaths_by_player = Death.where(killer_id: some_player_id) ```

### Fetch total kills in a match
``` total_kills = Death.where(match_id: some_match_id).count ```

### Fetch player rankings based on kills
``` player_rankings = Player.joins(:kills).group("players.id").order("count(deaths.id) DESC").count("deaths.id") ```
Deaths Grouped by Cause for Each Match

### Group deaths by cause for a specific match
``` grouped_deaths = Death.where(match_id: some_match_id).group(:cause).count ```

#### Next Steps

- Implement Charts for Better Visualization, I plan to add various types of charts to help users visualize match data and player performance more effectively.

- Implement Worker to Check Database Updates, a background worker will be implemented to check if the database is updated. If new log files are added, the worker will automatically run the service to parse them.

- Send Email Notifications to Players, an email notification system will be developed to alert players when new match logs are available. This will make it easier for players to keep track of their performance.

