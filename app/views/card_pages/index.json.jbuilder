json.array!(@card_pages) do |card_page|
  json.extract! card_page, :id, :name, :link
  json.url card_page_url(card_page, format: :json)
end
