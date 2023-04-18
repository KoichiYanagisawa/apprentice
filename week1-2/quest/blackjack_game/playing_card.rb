# frozen_string_literal: true

# デッキを表現するクラスです
class PlayingCard
  attr_reader :deck

  # 初期化で52枚のデッキを作る
  def initialize
    @deck = []
    marks = %w[スペード クラブ ハート ダイヤ]
    available_numbers = ['A'] + (2..10).to_a.map(&:to_s) + %w[J Q K]
    marks.each do |mark|
      available_numbers.each do |available_number|
        @deck << [mark, available_number]
      end
    end
  end
end
