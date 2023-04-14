text = <<~TEXT
  ・例外とは何か
  Rubyにおける例外は、それ自体がオブジェクトになっている。
  処理中にエラーが発生した場所からスローされると、キャッチされるところまでどんどん上の継承しているクラスに移っていく。
  ・何のためにあるのか？
  エラー発生箇所に適切に対処するため、気付かせるためにある。
  また、例外処理のコードに入り、指定したクラスと同じだった場合は、そのときの振る舞いを記述することでその後の処理を
  適切に行うことができる。よってクラッシュを防ぐこともできる。また、エラーが発生した後でも、必ず実行するコードを
  記述することができるため、openしたファイルを閉じる、db接続を切るなどを適切に行える。
TEXT