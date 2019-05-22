class HogwartsService
  def initialize(house_name)
    @house_name = house_name
  end

  def students
    get_students("#{get_house_id}")
  end

  private

  def get_house_id
    house_json = JSON.parse(conn.get.body, symbolize_names: true)
    house_json.select do |house|
      if house[:name] == @house_name
        return house[:id]
      end
    end
  end

  def get_students(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://hogwarts-as-a-service.herokuapp.com/api/v1/house/') do |f|
      f.headers['x_api_key'] = "lumos"
      f.adapter Faraday.default_adapter
    end
  end
end
