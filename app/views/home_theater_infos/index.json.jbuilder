json.array!(@home_theater_infos) do |home_theater_info|
  json.extract! home_theater_info, :id
  json.url home_theater_info_url(home_theater_info, format: :json)
end
