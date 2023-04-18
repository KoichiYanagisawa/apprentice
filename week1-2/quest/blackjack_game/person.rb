# frozen_string_literal: true

# 人のクラス
class Person
  # 手札
  attr_accessor :cards, :point, :score
  attr_reader :way_of_calling

  def initialize
    @cards = []
    @point = []
    @score = 0
    @way_of_calling = 'あなた'
  end
end
