servers = YAML.load_file('config/servers.yml')[Rails.env].symbolize_keys

config = {
  host: servers[:elasticsearch]
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)