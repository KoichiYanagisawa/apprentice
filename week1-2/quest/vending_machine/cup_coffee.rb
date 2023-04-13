require_relative 'item'

class CupCoffee < Item
  attr_reader :temperature
  def initialize(temperature)
    super('cup coffee')
    @temperature = temperature
    name.insert(0, "#{@temperature} ")
  end
end
