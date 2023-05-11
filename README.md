# polycul.es

[![Build Status](https://travis-ci.org/makyo/polycul.es.svg?branch=master)](https://travis-ci.org/makyo/polycul.es)
[![Coverage Status](https://coveralls.io/repos/github/makyo/polycul.es/badge.svg?branch=master)](https://coveralls.io/github/makyo/polycul.es?branch=master)
[![polycul.es](https://img.shields.io/website-up-down-green-red/https/polycul.es.svg)](https://polycul.es)

Graphing polyamorous relationships with force directed layouts.

## Development

### Docker
#### Prerequisites
You'll want docker and sqlite3 around. If you're planning to make changes to the models, you probably also want python
and Flask-Migrate.

#### Process
1. make your modifications
2. (optional, depends on the modifications) create migrations (`flask db migrate -m "description"`)
3. build the container
   ```commandline
   docker build -t polycul.es .
   ```

4. set up the dev database
   ```commandline
   sqlite3 dev.db
   ```

5. run the container
   ```commandline
   docker run --name polycules -d \
              -p 6969:5000 \
              --mount type=bind,source=$(pwd)/dev.db,target=/polycul.es/dev.db
              --mount type=bind,source=$(pwd)/uwsgi.dev.ini,target=/polycul.es/uwsgi.ini
              polycul.es
   ```

6. navigate to http://localhost:6969/

### The other way
You will need to install Python, virtualenv, and GraphViz using whatever package manager your operating system uses.  Then you can setup, run and test the application as follows:

1. Create a new virtualenv environment by running `make`
2. Run the application by running `make run` and opening http://localhost:5000/ in a browser
3. Run the tests by running `make test`

## License
This project is licensed under the [MIT License](LICENSE).
