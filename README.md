# README

The project is sample of Elasticsearch on Rails.  
ruby version 2.5.1  

```
bundle exec rails new . -M -C -S -J -T -d mysql
```

Use ActiveRecord and MySQL  

Elasticsearch Gems
====================

- github  
https://github.com/elastic/elasticsearch-rails

- Gemfile  
```
gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails'
gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails'
```

Create DB
====================

```
bundle exec rails db:create
bundle exec rails db:migrate
```

Start Rails
====================

```
bundle exec rails s
```
