# frozen_string_literal: true

# プレイヤークラス
class Player
  attr_accessor :cards, :point, :score
  attr_reader :way_of_calling

  def initialize(args = {})
    @cards = args[:cards] || []
    @point = args[:point] || []
    @score = args[:score] || 0
    @way_of_calling = args[:way_of_calling] || default_way_of_calling
  end

  # デフォルトの呼ばれ方をここで指定
  def default_way_of_calling
    'あなた'
  end
end
