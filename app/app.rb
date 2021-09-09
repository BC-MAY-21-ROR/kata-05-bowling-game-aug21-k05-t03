# frozen_string_literal: true

require_relative 'frame'
# frozen_string_literal: true

# This is the App Class
class App
  attr_reader :frame_scores, :rolls

  def initialize
    @frame_scores = []
    @rolls = []
    do_rolls
    get_scores
    puts 'rolls:'
    puts rolls
    puts 'frame scores'
    puts frame_scores
  end

  def do_rolls
    10.times do |_i|
      first_roll = rand(0..10)
      rolls.push(first_roll)
      first_roll != 10 ? rolls.push(rand(0..(10 - first_roll))) : ()
      get_scores
    end
  end

  def extra_roll
    rand(0..10)
  end

  def get_scores
    roll_count = 0
    frame_count = 0
    while roll_count < rolls.length
      if rolls[roll_count] == 10 # Strike!
        frame_scores[frame_count] = strike_score(roll_count)
        roll_count += 1
      elsif rolls[roll_count] + rolls[roll_count + 1] == 10 # Spare!
        frame_scores[frame_count] = spare_score(roll_count)
        roll_count += 2
      else
        frame_scores[frame_count] = rolls[roll_count] + rolls[roll_count + 1]
        roll_count += 2
      end
      frame_count += 1
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
end

App.new
