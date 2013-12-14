json.array!(@cards) do |card|
  json.extract! card, :id, :name, :english_name, :link, :img_link, :description, :profession, :type, :card_type, :cost, :attack, :health
  json.url card_url(card, format: :json)
end
