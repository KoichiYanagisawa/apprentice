# インターネットTV
### 以下にインターネットTVを利用するための手順を示します。
1. `internet_tv.sql`をMySQLを実行する環境に移動させます。
2. `internet_tv.sql`ファイルを配置したディレクトリに移動します。
3. `mysql -u root -p < internet_tv.sql`のコマンドを実行します。
4. 通常通りMySQLにログインします。
5. `show databases;`を実行し、`internet_tv`というデータベースがあることを確認します。
6. `use internet_tv`を実行します。
7. `show tables;`を実行します。
8. 以下のように表示されると利用準備完了です。お疲れ様でした。
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
