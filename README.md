# RBAT - Relatório Brasileiro de Acidentes em Lazer e Turismo

RBAT uses [resque](https://github.com/resque/resque) to generate the
spreadsheet reports. It currently uses resque 1.22. Therefore, this might be
relevant since it shows up in a specific warning currently being triggered:
https://web.archive.org/web/20130630113005/http://hone.heroku.com/resque/2012/08/21/resque-signals.html

## Development

We have a dev-tools.sh script in the root of the project. Please read it.

To run it, you should have `docker` and `docker-compose` installed and
configured in your system.

### Run test suite

```
./dev-tools.sh test
```

### Run development environment

```
./dev-tools.sh launch
```

Then, you can access RBAT in `http://localhost:3000`

### Clean up

```
./dev-tools.sh clean
```
