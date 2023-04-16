class MapQuestService
  def get_directions(start_location, end_location)
    get_url("/directions/v2/route?from=#{start_location}&to=#{end_location}")
  end

  private
  def conn
    Faraday.new(url: "http://www.mapquestapi.com") do |f|
      f.params['key'] = ENV['MAP_QUEST_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
