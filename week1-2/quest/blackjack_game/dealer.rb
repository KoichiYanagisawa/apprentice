# frozen_string_literal: true

require_relative 'player'
# Playerクラスを継承したDealerクラス
class Dealer < Player
  def initialize(args = {})
    super(args)
    @way_of_calling = args[:way_of_calling] || default_way_of_calling
  end

  # デフォルトの呼ばれ方をここで指定
  def default_way_of_calling
    'ディーラー'
  end
end
