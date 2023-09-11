# demo-app

generated using Luminus version "4.50"

FIXME

## Prerequisites

You will need [Leiningen][1] 2.0 or above installed.

[1]: https://github.com/technomancy/leiningen

## Running

To start a web server for the application, run:

    lein run 

## Migrations
All migrations are located in resources/migrations folder. It's an example of how to rename the column in existing table with zero downtime.

Step 1 - Create a new table with new column

Step 2 - Copy data from the old table

Step 3 - Create the triggers for update and insert

Step 4 - Swap the tables

Step 5 - Drop the old table


## License

Copyright © 2023 FIXME
