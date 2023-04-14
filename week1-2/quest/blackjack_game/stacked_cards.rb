# frozen_string_literal: true

require_relative 'playing_card'

# 場に出ているトランプ(山札)を表現するクラスです
class StackedCards < PlayingCard
  def draw
    return if @deck.empty?

    @deck.sample
  end
end

trump = StackedCards.new
pp trump.draw.size
