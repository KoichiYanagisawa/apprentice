require_relative 'drink'
require_relative 'cup_coffee'

class VendingMachine
  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
    @coin = 0
    @cup = 0
  end

  # 自動販売機の名前を取得するメソッド
  def press_manufacturer_name
    @manufacturer_name
  end

  # 購入ボタンを押下するメソッド
  def press_button(item)
    if @coin >= item.price
      item.buy_now
        @coin -= item.price
        item.name
    end
  end

  # 販売機にお金を投入するメソッド
  def deposit_coin(coin)
    if (coin % 100).zero?
      @coin += coin
    end
  end

  # 販売機にコーヒーカップを追加するメソッド
  def add_cup(input_volume)
    (@cup + input_volume) > 100 ? @cup = 100 : @cup += input_volume
  end
  private :press_manufacturer_name
end

hot_cup_coffee = CupCoffee.new('hot')
cider = Drink.new('cider')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)
