require_relative 'drink'
require_relative 'cup_coffee'
require_relative 'snack'

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

  # 投入金額と購入アイテムを比較し買えるか判断するメソッド
  def calc_rate(item)
    @coin >= item.price
  end

  # 決済を完了させて名前を返すメソッド
  def complete_payment(item)
    @coin -= item.price
    item.name
  end

  # 購入ボタンを押下するメソッド
  def press_button(item)
    if calc_rate(item)
      if item.class == CupCoffee
        if !@cup.zero?
          @cup -= 1
          complete_payment(item)
        end
      else
        complete_payment(item)
      end
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
snack = Snack.new('potato chips')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)

puts vending_machine.press_button(snack)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(snack)
