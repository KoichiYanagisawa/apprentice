# データベース関連の基本的な用語を説明できる

## 1. データベース

データベースとは何か、プログラミング初心者にわかるように説明してください。

 - 検索、登録、修正、削除の操作ができる。
 - 複数人で同時にアクセスして操作できる(ロックされ整合性を維持することもある)。
 - 壊れにくさ、壊れた時の復旧のしやすさ、素早い復旧などが求められている。
 - 一般ユーザーが意識せずともそこにあるもの。見えないように隠されている。

## 2. DBMS

DBMS とは何か、プログラミング初心者にわかるように説明してください。

 - データベースの機能を提供するソフトウェアのこと。「データベース」は機能や構造を表す抽象的概念なのに対して、
「DBMS」はそれらを実現するために作られた具体的なソフトウェアのこと。
 - 種類としては、RDBMS、階層型データベース管理システム、オブジェクト指向データベース管理システム、XMLデータベース管理システムなどがある。

## 3. RDBMS

RDBMS とは何か、プログラミング初心者にわかるように説明してください。また主要な RDBMS の製品を3つ挙げてください。

 - リレーショナルデータベースマネジメントシステムのこと。リレーショナルとは、関係のこと。関係データベースとも略される。
 - 関係とは、二次元表のこと。データを二次元表を使って管理するデータベースがRDBMS。
 - OracleやMySQL、PostgreSQLなどがある。

## 4. SQL

SQL とは何か、プログラミング初心者にわかるように説明してください。

 - Structured Query Languageの略。データ操作のためにRDBが備えている言語。
 - SELECT(検索),INSERT(登録),UPDATE(更新),DELETE(削除)の単語から始まる。
 - CRUD操作を目的とした言語。

## 5. テーブル

テーブルとは何か、プログラミング初心者にわかるように説明してください。

 - 表のこと。データベースの下に位置し、複数配置することができる。

## 6. カラム

カラムとは何か、プログラミング初心者にわかるように説明してください。

 - 列のこと。

## 7. レコード

レコードとは何か、プログラミング初心者にわかるように説明してください。

 - 行のこと。テーブル内に保存されているレコードは一行ずつで説明ができるようになっている。

## 8. クエリ

クエリとは何か、プログラミング初心者にわかるように説明してください。

 - DBに問い合わせるコマンドのこと。クエリはSQL文のひとつ。
