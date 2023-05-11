テーブル：users
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|外部キー|ユニークキー|
|----|----|----|----|----|----|----|----|
|user_id|int(10)||PRIMARY KEY|1|YES|||
|user_name|varchar(255)|||||||
|user_address|varchar(255)|||||||
|user_mail|varchar(255)|||||||

テーブル:products
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|外部キー|ユニークキー|
|----|----|----|----|----|----|----|----|
|product_id|bigint(20)||PRIMARY KEY|1|AUTO INCREMENT|||
|product_name|varchar(255)|||||||
|product_jancd|bigint(13)||INDEX|||||
|product_id|int(10)||INDEX|||YES||
|product_price|decimal(8,0)|||0||||
|product_description|varchar(255)|YES||||||
|minimum_order_unit|int(10)|YES||1||||

テーブル:inventories
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|外部キー|ユニークキー|
|----|----|----|----|----|----|----|----|
|product_id|bigint(20)||PRIMARY KEY|||YES||
|lot_num|bigint(20)||PRIMARY KEY|||||
|quantity|int(10)|||0||||
|best_by_date|date|YES||||||

テーブル:orders
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|外部キー|ユニークキー|
|----|----|----|----|----|----|----|----|
|order_num|bigint(20)||PRIMARY KEY|1|YES|||
|user_id|int(10)||INDEX|||YES||
|order_datetime|datetime|||||||

テーブル:order_details
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|外部キー|ユニークキー|
|----|----|----|----|----|----|----|----|
|order_num|bigint(20)||PRIMARY KEY|||YES||
|product_id|bigint(20)||PRIMARY EKY|||YES||
|quantity|int(10)|||1||||
