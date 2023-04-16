# frozen_string_literal: true

# 人のクラス
class Person
  # 手札
  attr_accessor :cards, :point, :way_of_calling

  def initialize
    @cards = []
    @point = []
    @way_of_calling = 'あなた'
  end
end
