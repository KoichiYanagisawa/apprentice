# require 'debug'

def set_deck
  deck = []
  suits = %w(スペード ダイヤ クラブ ハート)
  numbers = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  suits.each do |suit|
    numbers.each do |number|
      deck << [suit, number]
    end
  end
  deck.shuffle
end

def draw_cards(deck, num)
  deck.pop(num)
end

def score(card)
  return card[1].to_i if card[1].to_i > 0
  case card[1]
  when "J" then 11
  when "Q" then 12
  when "K" then 13
  when "A" then 1
  end
end

def hand(cards)
  scores = cards.map { |card| score(card) }.sort

  if cards.size == 2
    if scores[1] == scores[0] + 1 || scores[1] == scores[0] + 12
      "ストレート"
    elsif scores[0] == scores[1]
      "ペア"
    else
      "ハイカード"
    end
  elsif cards.size == 3
    if # スリーカードだったら
      "スリーカード"
    elsif # ストレートだったら
      "ストレート"
    elsif # ペアだったら
      "ペア"
    else
      "ハイカード"
    end
  end
end

puts "ポーカーを開始します。カードを引く枚数を選択してください（2, 3）："
while number_cards = gets.chomp.to_i
  break if number_cards == 2 || number_cards == 3
  puts "2枚か3枚を選択してください。："
end

deck = set_deck
player_cards = []
player_cards += draw_cards(deck, number_cards)
player_cards.each.with_index do |card, i|
  puts "あなたの引いたカードは#{player_cards[i][0]}の#{player_cards[i][1]}です。"
end

dealer_cards = []
dealer_cards += draw_cards(deck, number_cards)
dealer_cards.each.with_index do |card, i|
  puts "ディーラーの引いたカードは#{dealer_cards[i][0]}の#{dealer_cards[i][1]}です。"
end

puts "あなたの役は#{hand(player_cards)}です。"
puts "ディーラーの役は#{hand(dealer_cards)}です。"
