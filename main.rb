require './game'

game = MarvelGame.new("9d6b4b3e4dba453808d6e45b4ee5450da0145416", "8add549524ce6756e3b1860d4f3ac6cc")

player_one = {}
player_two = {}

loop do 
  puts "Player One \n"

  puts "Name of your character"
  player_one[:character] = gets.chomp!

  
  loop do 
    puts "What is your SEED (1-9)?"
    
    player_one[:seed] = gets.chomp!.to_i # This can break if invalid input

    break if (1..9).include?(player_one[:seed])
    puts "SEED out of range"
  end

  puts "Player Two \n"

  puts "Name of your character"
  player_two[:character] = gets.chomp!

  loop do 
    puts "What is your SEED (1-9)?"
    
    player_two[:seed] = gets.chomp!.to_i # This can break if invalid input

    break if (1..9).include?(player_two[:seed])
    puts "SEED out of range"
  end

  outcome = game.battle(player_one, player_two)

  puts "#{outcome} \n"

  puts "Do you want to play again? If yes, press ENTER. If no, press 'x'"

  command = STDIN.gets
  break if command.chomp! == "x"
end