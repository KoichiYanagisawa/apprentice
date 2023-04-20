# frozen_string_literal: true

# アナウンスをするクラス(コンソールに表示するクラス)
class Speaker
  # ブラックジャックの開始を伝えるメソッド
  def speak_start
    puts 'ブラックジャックを開始します。'
  end

  # 引いたカードの内容を読み上げるメソッド
  def speak_draw_card(person)
    puts "#{person.way_of_calling}の引いたカードは#{person.cards.last[0]}の#{person.cards.last[1]}です。"
  end

  # ディーラーが引いた2枚目のカードを読み上げるメソッド
  def second_card(person = nil)
    if !person.nil? && person.cards.last.size == 2
      puts "ディーラーの引いた2枚目のカードは#{person.cards.last[0]}の#{person.cards.last[1]}でした。"
      puts "ディーラーの現在の得点は#{person.score}です。"
    else
      puts 'ディーラーの引いた2枚目のカードはわかりません。'
    end
  end

  # 現在の得点を出力する
  def call_point(person, score)
    puts "#{person}の得点は#{score}です。"
  end

  # カードを引くか聞くメソッド
  def ask_draw_card(person)
    puts "#{person.way_of_calling}の現在の得点は#{person.score}です。カードを引きますか?(Y/N)"
  end

  # 引き分けを宣言するメソッド
  def draw_geme
    puts '引き分け！！！'
  end

  # 勝者を宣言するメソッド
  def declared_winner(person)
    puts "#{person}の勝ちです!"
  end

  # ゲーム終了を宣言するメソッド
  def end_of_game
    puts 'ブラックジャックを終了します。'
  end
end
