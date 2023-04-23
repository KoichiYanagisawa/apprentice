# frozen_string_literal: true

require_relative 'playing_card'
require_relative 'dealer'
require_relative 'player'
require_relative 'speaker'

# ブラックジャックゲームを司るクラス
class Blackjack
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @speaker = Speaker.new
    @deck = PlayingCard.new.shuffle
    @yes_or_no = ''
  end

  # 開始状態を作る
  def give_out_two_card(*args)
    @speaker.speak_start
    args.each do |person|
      2.times do
        draw_card(person)
        add_point(person)
        @speaker.speak_draw_card(person)
      end
    end
  end

  # カードを山札から引く
  def draw_card(person)
    return if @deck.empty?

    select_card = @deck[-1]
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
    sorted_instances = args.sort_by(&:score)
    sorted_instances.each { |person| @speaker.call_point(person) }
    sorted_score = sorted_instances.select { |person| person.score <= 21 }
    max_score = sorted_score.group_by(&:score).max.last
    if max_score.size >= 2
      @speaker.draw_game
    else
      @speaker.declared_winner(max_score[0])
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
