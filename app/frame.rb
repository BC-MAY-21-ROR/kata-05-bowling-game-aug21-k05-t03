# frozen_string_literal: true

# This the Class Frame where we store
class Frame
  attr :score, :rolls

  def initialize
    @score = 0
    @rolls = []
  end

  def make_roll
    roll = Roll.new
    score += roll.score
    rolls.push(roll)
    is_strike
    is_spare
  end

  def is_strike
    puts 'Is a Strike!' if score == 10 && rolls.size == 1
  end

  def is_spare
    puts 'Is a Spare!' if score == 10 && rolls.size == 2
  end
end
