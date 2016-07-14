require 'net/http'

module Web::Controllers::Home
  class Index
    include Web::Action

    expose :foo

    def call(params)
      pokemon_id = rand(1..500)
      uri = URI("http://pokeapi.co/api/v2/pokemon/#{pokemon_id}/")
      response = Net::HTTP.get(uri)
      json = JSON.parse(response)
      @foo = json["sprites"]["front_default"]
    end
  end
end
