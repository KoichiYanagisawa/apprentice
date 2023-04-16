# frozen_string_literal: true

require_relative 'stacked_cards'
require_relative 'dealer'
require_relative 'player'

# ブラックジャックのゲーム進行を司るクラス
class Blackjack
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @stacked_cards = StackedCards.new
  end

  # 開始時のカードを2枚まで振り分けるメソッド
  def start
    puts 'ブラックジャックを開始します。'
    @player.cards << @stacked_cards.draw_card
    speak_draw_card(@player)
    @player.cards << @stacked_cards.draw_card
    speak_draw_card(@player)
    @dealer.cards << @stacked_cards.draw_card
    speak_draw_card(@dealer)
    @dealer.cards << @stacked_cards.draw_card
    speak_draw_card(@dealer)
    calc_point(@dealer)
    pp print_score(@dealer)
  end

  # 引いたカードを読み上げるメソッド
  def speak_draw_card(person, draw_additinonal_card = false)
    case person
    when Player
      puts "あなたの引いたカードは#{person.cards.last[0]}の#{person.cards.last[1]}です。"
    when Dealer
      if person.cards.size == 2
        puts 'ディーラーの引いた2枚目のカードはわかりません。'
      elsif person.cards.size == 2 && draw_additinonal_card
        puts "ディーラーの引いた2枚目のカードは#{person.cards.last[0]}の#{person.cards.last[1]}でした。"
      else
        puts "ディーラーの引いたカードは#{person.cards.last[0]}の#{person.cards.last[1]}です。"
      end
    end
  end

  # 引数で与えられたpersonの得点を計算する
  def calc_point(person)
    person.cards.each do |card|
      person.point <<
        if card & %w[J Q K]
          p card
          10
        elsif card[1] == 'A'
          1
        else
          card[1].to_i
        end
    end
    puts person.point
  end

  # 引数で与えられたポイントを元に、得点を出力する。
  def print_score(person)
    point = person.point
    puts point
    score =
      if point.sum > 21 && point.include?(1)
        point.sum - 10
      else
        point.sum
      end
    puts "#{person.way_of_calling}の得点は#{score}です。"
  end

  # ゲームを進行する
  def progressing_game
  end
end

blackjack = Blackjack.new
blackjack.start
