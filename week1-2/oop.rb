class Gear
  attr_reader :chainring, :cog

  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  # def gear_inches
  #   ratio * wheel.diameter
  # end

  # def gear_inches
  #   ratio * Wheel.new(rim, tire).diameter
  # end

  # def gear_inches
  #   ratio * wheel.diameter
  # end

  # def gear_inches
  #   foo = some_intermediate_result * diameter
  # end

  def gear_inches(diameter)
    ratio * diameter
  end

  def diameter
    wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end

end

class Wheel
  attr_reader :rim, :tire, :gear

  def initialize(rim, tire, chainring, cog)
    @rim = rim
    @tire = tire
    @gear = Gear.new(chainring, cog)
  end

  def diameter
    rim + (tire * 2)
  end

  # def circumference
  #   diameter * Math::PI
  # end
  def gear_inches
    gear.gear_inches(diameter)
  end
end

# Gear.new(52,11,26,1.5).gear_inches
Wheel.new(26,1.5,52,11).gear_inches
