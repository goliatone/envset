menagerie:
  build: .
  command: node app.js --dev
  links:
      - postgres
  environment:
    - DEBUG=*
    - NODE_ENV=${NODE_ENV}
    - NODE_POSTGRES_USER=${NODE_POSTGRES_USER}
    - NODE_POSTGRES_PSWD=${NODE_POSTGRES_PSWD}
    - NODE_POSTGRES_DATABASE=${NODE_POSTGRES_DATABASE}
    - NODE_POSTGRES_ENDPOINT=${NODE_POSTGRES_ENDPOINT}
    - NODE_HONEYBADGER_KEY=${NODE_HONEYBADGER_KEY}
    - NODE_AWS_ACCESS_KEY_ID=${NODE_AWS_ACCESS_KEY_ID}
    - NODE_AWS_SECRET_ACCESS_KEY=${NODE_AWS_SECRET_ACCESS_KEY}
  restart: always
  log_opt:
      max-size: "1g"
      max-file: "4"
  ports:
    - "1337:1337"
postgres:
  image: postgres
  ports:
    - "5432:5432"
  log_opt:
    max-size: "1g"
    max-file: "4"
