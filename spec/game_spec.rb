require './app/game.rb'
require 'spec_helper'

describe Game do

  before do
    @game = Game.new
  end

  context "do_rolls store and array of numbers in rolls" do
    it "it return 10" do
      expect(@game.do_rolls).to eq 10
    end
    it "it doesn't return nothing from 10" do
      expect(@game.do_rolls).not_to eq !10
    end
    it "it changes rolls from empty" do
      @game.do_rolls
      expect(@game.rolls).not_to eq []
    end
    it "it fill rolls array with numbers" do
      @game.do_rolls
      expect(@game.rolls).to all( be_an(Integer))
    end
  end

  context "extra_roll returns a number between 0 and 10" do
    it "it returns a number" do
      expect(@game.extra_roll).to be_an(Integer)
    end
    it "it is bigger or equal to 0" do
      expect(@game.extra_roll).to be >= 0
    end
    it "it is smaller or equal to 10" do
      expect(@game.extra_roll).to be <= 10
    end
  end
end