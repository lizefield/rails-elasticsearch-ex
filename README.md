# README

The project is sample of Elasticsearch on Rails.  
ruby version 2.5.1  

```
bundle exec rails new . -M -C -S -J -T -d mysql
```

Use ActiveRecord and MySQL  


Elasticsearch
====================

- docker  
https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

- docker-compose

```
version: '3.3'
services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:6.4.0
    restart: always
    ports:
      - 9200:9200
      - 9300:9300
    environment:
      - discovery.type=single-node
```

- docker container start  
```docker-compose up -d elasticsearch```

- check started  
http://localhost:9200


Kibana
====================

- download  
```wget https://artifacts.elastic.co/downloads/kibana/kibana-6.4.0-linux-x86_64.tar.gz```

- uncompress  
```tar -zxvf kibana-6.4.0-linux-x86_64.tar.gz```

- config

```
vi config/kibana.yml
elasticsearch.url: "http://localhost:9200"
```

- start  
```bin/kibana```

- check started  
http://localhost:5601


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

Details
====================

- config/initializers/elasticsearch.rb  
It settings Elasticsearch server host.

- app/models/article.rb  
Just added include. It automatically insert/update/delete to Elasticsearch.

```
class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
```

- app\controllers\articles_controller.rb  
Search from Elasticsearch

```
logger.debug '=================================================='
params = {
  query: {
    match_all: {}
  }
}
response = Article.search params
logger.debug "took:#{response.took}"
logger.debug "total:#{response.results.total}"
logger.debug '--------------------------------------------------'
response.results.each do |record|
  logger.debug "title:#{record.title}"
end
logger.debug '=================================================='
```