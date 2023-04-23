# frozen_string_literal: true

require_relative 'player'
# Playerクラスを継承したDealerクラス
class Dealer < Player
  # デフォルトの呼ばれ方をここで指定(playerの同メソッドをオーバーライド)
  def default_way_of_calling
    'ディーラー'
  end
end
