# frozen_string_literal: true

require_relative 'playing_card'
require_relative 'dealer'
require_relative 'player'
require_relative 'speaker'

# ブラックジャックのゲーム進行を司るクラス
class Blackjack
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @speaker = Speaker.new
    @deck = PlayingCard.new.deck
    @yes_or_no = ''
  end

  # 開始状態を作るメソッド
  def give_out_two_card(*args)
    @speaker.speak_start
    args.each do |person|
      (1..2).each do |count|
        draw_card(person)
        add_point(person)
        if count == 2 && person.instance_of?(Dealer)
          @speaker.second_card
        else
          @speaker.speak_draw_card(person)
        end
      end
    end
  end

  # カードを山札から引くメソッド
  def draw_card(person)
    return if @deck.empty?

    select_card = @deck.sample
    @deck -= [select_card]
    person.cards << select_card
  end

  # トランプの1~13に対応したポイントを加算する
  def add_point(person)
    person.point <<
      if %w[J Q K].include?(person.cards.last[1])
        10
      elsif person.cards.last[1] == 'A'
        11
      else
        person.cards.last[1].to_i
      end
    calc_score(person)
  end

  # 引数で与えられたポイントを得点として計算する
  def calc_score(person)
    point = person.point
    person.score =
      if point.sum > 21 && point.include?(11)
        point.sum - 10
      else
        point.sum
      end
  end

  # プレイヤーのゲームを進行する
  def player_progressing_game(person)
    return unless person.score < 21

    @speaker.ask_draw_card(person)
    @yes_or_no = gets.upcase
    return unless y_or_n?

    draw_card(@player)
    add_point(@player)
    @speaker.speak_draw_card(person)
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
    @speaker.second_card(person) if person.cards.size == 2
    return if @player.score > 21

    return unless (person.score < 17) && (person.score <= 21)

    draw_card(person)
    add_point(person)
    @speaker.speak_draw_card(person)
    dealer_progressing_game(person)
  end

  # 勝敗を決める
  def victory_or_defeat(*args)
    arr = args.map { |arg| [arg.way_of_calling, arg.score] }
    arr = arr.sort { |a, b| a[1] <=> b[1] }
    arr.each { |inner_arr| @speaker.call_point(inner_arr[0], inner_arr[1]) }
    result = arr.select { |inner_arr| inner_arr[1] <= 21 }
    if result.size == 2 && result[-1][1] == result[-2][1]
      @speaker.draw_geme
    else
      @speaker.declared_winner(result.last[0])
    end
    @speaker.end_of_game
  end

  # ゲームをプレイする
  def play
    give_out_two_card(@player, @dealer)
    player_progressing_game(@player)
    dealer_progressing_game(@dealer)
    victory_or_defeat(@player, @dealer)
  end
end

blackjack = Blackjack.new
blackjack.play
