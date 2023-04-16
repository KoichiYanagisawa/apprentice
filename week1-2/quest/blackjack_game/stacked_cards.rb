# frozen_string_literal: true

require_relative 'playing_card'

# 場に出ているトランプ(山札)を表現するクラス
class StackedCards < PlayingCard
  # 山札から1枚めくるメソッド
  def draw_card
    return if @deck.empty?

    select_card = @deck.sample
    @deck -= [select_card]
    select_card
  end
end
