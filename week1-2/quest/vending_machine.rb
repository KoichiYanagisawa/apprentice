class VendingMachine
  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
    @coin = 0
  end

  def press_manufacturer_name
    @manufacturer_name
  end

  def press_button(soft_drink)
    case soft_drink.name
    when 'cider'
      if @coin >= 100
        @coin -= 100
        'cider'
      end
    when 'cola'
      if @coin >= 150
        @coin -= 150
        'cola'
      end
    end
  end

  def deposit_coin(coin)
    if(coin % 100 == 0)
      @coin += coin
    end
  end
  private :press_manufacturer_name
end

class SoftDrink
  attr_reader :name, :price

  def initialize(name)
    @name = name
    @price = drink_type
  end

  def drink_type
    case @name
    when 'cider'
      100
    when 'cola'
      150
    end
  end
end

cola = SoftDrink.new('cola')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
print "出力1回目:"
puts vending_machine.press_button(cola)
vending_machine.deposit_coin(100)
print "出力2回目:"
puts vending_machine.press_button(cola)
