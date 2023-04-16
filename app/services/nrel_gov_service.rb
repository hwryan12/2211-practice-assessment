class NrelGovService
  def station(location)
    get_url("/api/alt-fuel-stations/v1/nearest.geojson?location=#{location}&fuel_type=ELEC&limit=1")
  end

  private
  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.params['api_key'] = ENV['NREL_GOV_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end