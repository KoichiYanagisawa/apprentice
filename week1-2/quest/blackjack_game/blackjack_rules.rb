# frozen_string_literal: true

# ブラックジャックのルールを司るクラス
class BlackjackRules
  # ゲーム開始時に2枚まで振り分けるメソッド
  def start(*args)
    args.each do |person|
      (1..2).each do |count|
        draw_card(person)
        add_point(person)
        if count == 2 && person.instance_of?(Dealer)
          @speaker.second_card
        else
          @speaker.speak_draw_card(person.way_of_calling, person.cards.last)
        end
      end
    end
  end
end
