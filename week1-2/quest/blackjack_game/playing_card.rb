# frozen_string_literal: true

# トランプを表現するクラスです
class PlayingCard
  attr_reader :deck

  # 初期化で52枚のデッキを作る
  def initialize
    @deck = []
    marks = %w[spade club heart diamond]
    available_numbers = ['A'] + (2..10).to_a.map(&:to_s) + %w[J Q K]
    marks.each do |mark|
      available_numbers.each do |available_number|
        @deck << [:back, mark, available_number]
      end
    end
  end
end
