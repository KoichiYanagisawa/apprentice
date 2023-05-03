require_relative 'oop5'

class Bicycle
  attr_reader :size, :parts

  def initialize(args = {})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class Parts
  # attr_reader :chain, :tire_size
  attr_reader :parts

  # def initialize(args={})
  #   @chain = args[:chain] || default_chain
  #   @tire_size = args[:tire_size] || default_tire_size
  #   post_initialize(args)
  # end

  def initialize(parts)
    @parts = parts
  end

  # def spares
  #   {
  #     tire_size: tire_size,
  #     chain: chain
  #   }.merge(local_spares)
  # end

  def spares
    parts.select{ |part| part.needs_spare}
  end

  # def default_tire_size
  #   raise NotImplementedError
  # end

  # def post_initialize(args)
  #   nil
  # end

  # def local_spares
  #   {}
  # end

  # def default_chain
  #   '10-speed'
  # end
end

require 'forwardable'
class Part
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable
  # attr_reader :name, :description, :needs_spare

  # def initialize(args)
  #   @name = args[:name]
  #   @description = args[:description]
  #   @needs_spare = args.fetch(:needs_spare, true)
  def initialize(parts)
    @parts = parts
  end

  def spares
    select{|part| part.needs_spare}
  end
end

# class RoadBikeParts < Parts
#   attr_reader :tape_color

#   def post_initialize(args)
#     @tape_color = args[:tape_color]
#   end

#   def local_spares
#     {tape_color: tape_color}
#   end

#   def default_tire_size
#     '23'
#   end
# end

# class MountainBikeParts < Parts
#   attr_reader :front_shock, :rear_shock

#   def post_initialize(args)
#     @front_shock = args[:front_shock]
#     @rear_shock = args[:rear_shock]
#   end

#   def local_spares
#     {rear_shock: rear_shock}
#   end

#   def default_tire_size
#     '2.1'
#   end
# end


road_config = [
  ['chain', '10-speed'],
  ['tire_size', '2.1'],
  ['tape_color', 'red']
]
mountain_config = [
  ['chain', '10-speed'],
  ['tire_size','2.1'],
  ['front_shock','Manitou', false],
  ['rear_shock','Fox'],
]

road_bike = Bicycle.new(size: 'L', parts:PartsFactory.build(road_config))
pp road_bike.spares
