require_relative 'item'

class CupCoffee < Item
  attr_reader :temperature
  @container
  def initialize(temperature)
    super('cup coffee')
    @temperature = temperature
    name.insert(0, "#{@temperature} ")
  end

  def container(container)
    if !container.zero?
      container -= container
    end
  end
end
