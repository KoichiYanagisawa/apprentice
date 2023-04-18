# frozen_string_literal: true

# アナウンスをするクラス(コンソールに表示するクラス)
class Speaker
  # ブラックジャックの開始を伝えるメソッド
  def speak_start
    puts 'ブラックジャックを開始します。'
  end

  # 引いたカードの内容を読み上げるメソッド
  def speak_draw_card(player_name, array_card)
    puts "#{player_name}の引いたカードは#{array_card[0]}の#{array_card[1]}です。"
  end

  # ディーラーが引いた2枚目のカードを読み上げるメソッド
  def second_card(array_card = [], score = 0)
    if array_card.size == 2
      puts "ディーラーの引いた2枚目のカードは#{array_card[0]}の#{array_card[1]}でした。"
      puts "ディーラーの現在の得点は#{score}です。"
    else
      puts 'ディーラーの引いた2枚目のカードはわかりません。'
    end
  end

  # 現在の得点を出力する
  def call_point(person, score)
    puts "#{person}の得点は#{score}です。"
  end

  # カードを引くか聞くメソッド
  def ask_draw_card(name, score)
    puts "#{name}の現在の得点は#{score}です。カードを引きますか?(Y/N)"
  end

  # 引き分けを宣言するメソッド
  def draw_geme
    puts "引き分け！！！"
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
