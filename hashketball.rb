require 'pry'

def game_hash 
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3 ,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    }, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(player)
  game_hash.each do |location, team_data| 
    team_data.each do |key, data|
      if key == :players
        data.each do |player_hash|
          if player_hash[:player_name] == player
            return player_hash[:points]
          end 
        end 
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data| 
    team_data.each do |key, data|
      if key == :players
        data.each do |player_hash|
          if player_hash[:player_name] == player
            return player_hash[:shoe]
          end 
        end 
      end
    end
  end
end 

def team_colors(team)
  game_hash.each do |location, team_data| 
    if team_data[:team_name] == team 
      return team_data[:colors] 
    end 
  end
end 

def team_names
  array = [] 
  game_hash.each do |location, team_data|
    array << team_data[:team_name] 
  end 
  array
end 

def player_numbers(team)
  array = []
  game_hash.each do |location, team_data| 
    if team_data[:team_name] == team 
      team_data[:players].each do |player_hash|
        array << player_hash[:number]
      end 
    end 
  end
  array 
end 

def player_stats(player)
  new_hash = {}
  game_hash.each do |location, team_data| 
    team_data.each do |key, data|
      if key == :players
        data.each do |player_hash|
          if player_hash[:player_name] == player
            new_hash = { 
              :number => player_hash[:number],
              :shoe => player_hash[:shoe],
              :points => player_hash[:points],
              :rebounds => player_hash[:rebounds],
              :assists => player_hash[:assists],
              :steals => player_hash[:steals],
              :blocks => player_hash[:blocks],
              :slam_dunks => player_hash[:slam_dunks]
            } 
          end 
        end 
      end
    end
  end
  new_hash
end 

def largest_shoes
  max_shoe = 0 
  max_shoe_player = "default"
  game_hash.each do |location, team_data| 
    team_data.each do |key, data|
      if key == :players
        data.each do |player_hash|
          if player_hash[:shoe] > max_shoe
            max_shoe = player_hash[:shoe]
            max_shoe_player = player_hash[:player_name]
          end 
        end 
      end
    end
  end
  max_shoe_player
end 

def big_shoe_rebounds
  shoe_guy = largest_shoes
  game_hash.each do |location, team_data| 
    team_data.each do |key, data|
      if key == :players
        data.each do |player_hash|
          if player_hash[:player_name] == shoe_guy
            return player_hash[:rebounds]
          end 
        end  
      end
    end
  end
end 