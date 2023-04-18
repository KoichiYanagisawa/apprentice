# frozen_string_literal: true

require_relative 'player'
# Personクラスを継承したDealerクラス
class Dealer < Player
  def initialize
    super
    @way_of_calling = 'ディーラー'
  end
end
