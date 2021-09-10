# frozen_string_literal: true

# This the Class Frame where we store
class Game
  attr :frame_scores, :rolls

  def initialize
    @frame_scores = []
    @rolls = []
  end

  def start
    do_rolls
    get_scores
  end

  def do_rolls
    10.times do
      first_roll = rand(0..10)
      rolls.push(first_roll)
      rolls.push(rand(0..(10 - first_roll))) if first_roll != 10
    end
  end

  def extra_roll
    roll = rand(0..10)
    rolls.push(roll)
    puts "extra roll: #{roll}"
    roll
  end

  def get_scores
    roll_count = 0
    score = 0
    (0..9).each do |frame_count|
      if rolls[roll_count] == 10 # Strike!
        score += strike_score(roll_count)
        print_strike(score)
        roll_count += 1
      elsif rolls[roll_count] + rolls[roll_count + 1] == 10 # Spare!
        score += spare_score(roll_count)
        print_spare(rolls[roll_count], score)
        roll_count += 2
      else
        score += rolls[roll_count] + rolls[roll_count + 1]
        print_normal(roll_count, score)
        roll_count += 2
      end
      frame_scores[frame_count] = score
    end
  end

  def strike_score(roll_count)
    score = rolls[roll_count]
    score += rolls[roll_count + 1]   || extra_roll
    score += rolls[roll_count + 2]   || extra_roll
  end

  def spare_score(roll_count)
    score = rolls[roll_count] + rolls[roll_count + 1]
    score += rolls[roll_count + 2] || extra_roll
  end

  def print_strike(score)
    puts '|    X |'
    puts "| #{score} |"
    puts '________'
  end

  def print_spare(roll, score)
    puts "|#{roll}  / |"
    puts "| #{score} |"
    puts '________'
  end

  def print_normal(roll_count, score)
    puts "|#{rolls[roll_count]}  #{rolls[roll_count + 1]} |"
    puts "| #{score} |"
    puts '________'
  end
end
