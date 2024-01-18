# Lunch Management commands

- Docker
- Ruby 3.2.2
- Ruby on Rails 7.0.8
- Mysql 8.0

## Build development environment

#### Step1 clone this project
```bash
$ git clone https://github.com/MTM-SiThuPhyo/Lunch-Management.git
```

### Step2 Preparing development environment files

```bash
# 環境変数
$ cp .env.example .env

```

### Step3 Start the development environment using docker-compose

```bash
$ docker-compose build
$ docker-compose up -d
$ docker-compose exec app sh
$ rails db:create
$ rails db:migrate
$ rails db:seed
```
