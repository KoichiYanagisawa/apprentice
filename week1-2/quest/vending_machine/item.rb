class Item
  attr_reader :name, :price

  def initialize(name)
    @name = name
    @price = item_type
  end

  def item_type
    case @name
    when 'cider'
      100
    when 'cola'
      150
    when 'cup coffee'
      100
    when 'potato chips'
      150
    end
  end
end
