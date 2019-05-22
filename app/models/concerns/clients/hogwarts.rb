module Clients::Hogwarts
  def conn
    Faraday.new('https://hogwarts-as-a-service.herokuapp.com/api/v1/house') do |f|
      f.headers['x_api_key'] = ENV["HOGWARTS_API_KEY"]
      f.adapter  Faraday.default_adapter
    end
  end

  def get_json(query_path)
    response = conn.get "#{query_path}"
    JSON.parse(response.body, symbolize_names: true)
  end
end
