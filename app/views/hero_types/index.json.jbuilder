json.array!(@hero_types) do |hero_type|
  json.extract! hero_type, :id, :name, :link
  json.url hero_type_url(hero_type, format: :json)
end
