require 'rest-client'
require 'json'

class MarvelGame

  MAGIC = ["gamma", "radioactive"]  
  
  def initialize(private_key, public_key) 
    @ts = Time.new.strftime '%s' 
    @digest = Digest::MD5.hexdigest '%s%s%s' % [@ts, private_key, public_key]
    @hash = 'ts=%s&apikey=%s&hash=%s' % [@ts, public_key, @digest]
  end  

  def battle(one, two)
    player_one = generate_player(one[:character], one[:seed])
    player_two = generate_player(two[:character], two[:seed])

    if player_one.nil? || player_two.nil?
      outcome = "Invalid Input"
    end

    if player_one == player_two
      outcome = "Tie"
    elsif player_two == -1
      outcome = "Player Two Wins"
    else
      outcome = player_one == -1 || player_one > player_two ? "Player one wins" : "Player two wins!" 
    end

    outcome
  end

  private

  def generate_player(character="spider-man", seed=1)
    begin
      description = fetch_description(character)
      word = get_word(description, seed)
      MAGIC.include?(word.downcase) ? -1 : word.length
    rescue StandardError => e  
      puts e.message
      exit(1) 
    end
  end
  
  def fetch_description(character)
    response = RestClient.get "http://gateway.marvel.com/v1/public/characters?name=#{character}&#{@hash}" 
    
    data = JSON.parse(response.body)["data"]

    if data["total"] == 0
      raise 'No Results' 
    end

    result = data["results"][0] # assume first results is only result
    
    if result.nil?
      raise 'No Results'
    end

    result["description"]
  end  

  def get_word(description, seed)
    if seed < 1
      raise 'Seed has to be (1-9)' 
    end
    words = description.split(" ")
    words[--seed]
  end  
end