# frozen_string_literal: true

# ゲーム内の計算を担うモジュール
module CalculateGame
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

  # 勝敗を決める
  def victory_or_defeat(*args)
    sorted_instances = args.sort_by(&:score)
    sorted_instances.each { |person| @display_result.call_point(person) }
    sorted_score = sorted_instances.select { |person| person.score <= 21 }
    max_score = sorted_score.group_by(&:score).max.last
    if max_score.size >= 2
      @display_result.draw_game
    else
      @display_result.declared_winner(max_score[0])
    end
    @display_result.end_of_game
  end
end
