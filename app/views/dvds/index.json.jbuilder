json.array!(@dvds) do |dvd|
  json.extract! dvd, :id
  json.url dvd_url(dvd, format: :json)
end
