# frozen_string_literal: true

require_relative 'playing_card'
require_relative 'dealer'
require_relative 'player'
require_relative 'display_result'
require_relative 'calculate_game'

# ブラックジャックゲームを司るクラス
class Blackjack
  include CalculateGame
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @display_result = DisplayResult.new
    @playing_card = PlayingCard.new.shuffle
    @yes_or_no = ''
  end

  # ゲームをプレイする
  def play
    give_out_two_card(@player, @dealer)
    player_progressing_game(@player)
    dealer_progressing_game(@dealer)
    victory_or_defeat(@player, @dealer)
  end

  # 開始状態を作る
  def give_out_two_card(*args)
    @display_result.speak_start
    args.each do |person|
      2.times do
        draw_card(person)
        add_point(person)
        @display_result.speak_draw_card(person)
      end
    end
  end

  # カードを山札から引く
  def draw_card(person)
    return if @playing_card.empty?

    select_card = @playing_card[-1]
    @playing_card -= [select_card]
    person.cards << select_card
  end

  # プレイヤーのゲームを進行する
  def player_progressing_game(person)
    return unless person.score < 21

    @display_result.ask_draw_card(person)
    @yes_or_no = gets.upcase
    return unless y_or_n?

    draw_card(@player)
    add_point(@player)
    @display_result.speak_draw_card(person)
    player_progressing_game(person)
  end

  # 入力されたのがYかNかを判断する
  def y_or_n?
    if @yes_or_no.include?('Y')
      true
    elsif @yes_or_no.include?('N')
      false
    else
      raise StandardError, "Y/Nで入力してください。対象外の入力値:#{@yes_or_no}"
    end
  end

  # ディーラーのゲームを「自動」で進行する
  def dealer_progressing_game(person)
    @display_result.second_card(person) if person.cards.size == 2
    return if @player.score > 21

    return unless (person.score < 17) && (person.score <= 21)

    draw_card(person)
    add_point(person)
    @display_result.speak_draw_card(person)
    dealer_progressing_game(person)
  end
end

blackjack = Blackjack.new
blackjack.play
