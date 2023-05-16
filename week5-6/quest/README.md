# インターネットTV

## インターネットTVのQUEST回答は以下となります。

### **ステップ1**:テーブル設計
- [ER図](/Users/koichi/apprentice/week5-6/quest/internet_tv.pu)

- [テーブル設計](/Users/koichi/apprentice/week5-6/quest/internet_tv.md)

### **ステップ2**:テーブル構築とサンプルデータ投入

以下では、SQL文をまとめて実行する手順を示しますが、該当SQL文をコピー&ペーストで１行ずつ実行しても構いません。

1. [internet_tv.sql](/Users/koichi/apprentice/week5-6/quest/internet_tv.sql)をMySQLを実行する環境に移動させます。または、`git clone`をしても構いません。

2. `internet_tv.sql`ファイルを配置したディレクトリに移動します。

3. `mysql -u root -p < internet_tv.sql`のコマンドを実行します。

4. `mysql -u root -p`コマンドでMySQLにログインします。

5. `show databases;`を実行し、`internet_tv`というデータベースがあることを確認します。

6. `use internet_tv`を実行します。

7. `show tables;`を実行します。

8. 以下のように表示されましたら利用準備完了です。

```
+-----------------------+
| Tables_in_internet_tv |
+-----------------------+
| channels              |
| episodes              |
| genres                |
| program_genres        |
| program_list          |
| seasons               |
| series                |
+-----------------------+
```

### **ステップ3**:データ抽出クエリ

[quest_step3.sql](/Users/koichi/apprentice/week5-6/quest/quest_step3.sql)内のSQL文をまとめて実行する手順を以下に示します。なお、該当のSQL文をコピー&ペーストで１行ずつ実行しても構いません。

1. `quest_step3.sql`ファイルを配置したディレクトリに移動します。

2. `mysql -u root -p`コマンドでMySQLにログインします。

3. `use internet_tv`を実行します。

4. `source ./quest_step3.sql`とコマンドを実行します。
