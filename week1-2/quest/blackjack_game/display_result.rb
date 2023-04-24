# frozen_string_literal: true

# アナウンスをするクラス(コンソールに表示するクラス)
class DisplayResult
  # ブラックジャックの開始を伝える
  def speak_start
    puts 'ブラックジャックを開始します。'
  end

  # 引いたカードの内容を読み上げる
  def speak_draw_card(person)
    if person.instance_of?(Dealer) && person.cards.size == 2
      puts 'ディーラーの引いた2枚目のカードはわかりません。'
    else
      puts "#{person.way_of_calling}の引いたカードは#{person.cards.last[0]}の#{person.cards.last[1]}です。"
    end
  end

  # ディーラーが引いた2枚目のカードを読み上げる
  def second_card(person)
    puts "ディーラーの引いた2枚目のカードは#{person.cards.last[0]}の#{person.cards.last[1]}でした。"
    puts "ディーラーの現在の得点は#{person.score}です。"
  end

  # 現在の得点を出力する
  def call_point(person)
    puts "#{person.way_of_calling}の得点は#{person.score}です。"
  end

  # カードを引くか聞く
  def ask_draw_card(person)
    puts "#{person.way_of_calling}の現在の得点は#{person.score}です。カードを引きますか?(Y/N)"
  end

  # 引き分けを宣言する
  def draw_game
    puts '引き分け！！！'
  end

  # 勝者を宣言する
  def declared_winner(person)
    puts "#{person.way_of_calling}の勝ちです!"
  end

  # ゲーム終了を宣言する
  def end_of_game
    puts 'ブラックジャックを終了します。'
  end
end
