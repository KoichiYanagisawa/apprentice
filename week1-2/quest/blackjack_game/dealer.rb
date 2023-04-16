# frozen_string_literal: true

require_relative 'person'

class Dealer < Person
  def initialize
    super
    @way_of_calling = 'ディーラー'
  end
end
