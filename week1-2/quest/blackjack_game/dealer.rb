# frozen_string_literal: true

require_relative 'person'
# Personクラスを継承したDealerクラス
class Dealer < Person
  def initialize
    super
    @way_of_calling = 'ディーラー'
  end
end
