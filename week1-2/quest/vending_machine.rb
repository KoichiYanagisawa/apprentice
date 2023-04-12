class VendingMachine
  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
    @coin = 0
  end

  def press_manufacturer_name
    @manufacturer_name
  end

  def press_button
    if @coin >= 100
      @coin -= 100
      'cider'
    end
  end

  def deposit_coin(coin)
    if(coin % 100 == 0)
      @coin = coin
    end
  end
  private :press_manufacturer_name
end

vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_button

vending_machine.deposit_coin(150)
puts vending_machine.press_button

vending_machine.deposit_coin(100)
puts vending_machine.press_button

puts vending_machine.press_manufacturer_name
