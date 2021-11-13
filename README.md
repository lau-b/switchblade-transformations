# Goal:

Transform static information about a bike's location into a route.

Every 15 minutes, information about a bikes current location is written into the database. Because bikes only send geo information when locked, we are bound to get a lot of redundant information. For example, during night most bikes will remain in the same location for a long period of time, so every 15 minutes we will get the same longitude and latitude data for that bike. When the bike is then unlocked and used – for let's say 40 minutes – we don't get information about the bikes location, until it is locked again. We then receive totally different longitude and latitude data.

Also bikes can be put into stations. When a bike is put into a station, we get different data, and this data will be stored in a different table (`kvb_stations`). It is very possible for a bike to be picked up on the streets, and being locked inside a station. So following steps are necessary to derive a valid route from the static data we get:

1. Combine tables `bikes` and `kvb_stations` and order them by the `point_in_time`. This is achieved by running the models `bikes_at_stations`, `bikes_in_street` and then `all_bikes`.
2. Remove duplicate observations (*bike stays at the same location*) and take the *minimum* and *maximum* timestamp to find approximately when a bike was locked and unlocked. Model `bikes_single_locations` is doing that.
3. We now have information for how long a bike has been staying at a specific location, and we know about the next location the bike has been put. By ordering by the *first_seen*-timestamp we can take the *longitude* and *latitude* data to create a route with the starting and ending location. This is done by running the `bike_routes` model.

**## Good to knows:**

- For documentation and tests check out `models/kvb/schema.yml`.
- The models `bike_routes` and `bikes_single_locations` use window functions in combination with aggregations `MAX()`, `MIN()` and `LEAD()`. To find out how window functions are working, check the [postgres documentation](https://www.postgresql.org/docs/9.1/tutorial-window.html).

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
