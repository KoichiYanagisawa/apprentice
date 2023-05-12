テーブル：channels

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|-------|--------|----|---|-----|--------------|
|channel_id|int(4)||PRIMARY|1|YES|
|channel_name|varchar(100)|||||
- ユニークキー制約：channel_name カラムに対して設定

テーブル：program_list

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|-------|--------|----|---|-----|--------------|
|program_id|int(10)||PRIMARY|1|YES|
|channel_id|int(4)|||||
|episode_id|int(4)|||||
|program_list_title|varchar(100)|||||
|playback_datetime|datetime|||||
|program_list_info|varchar(255)|||||
|program_list_views|int(10)|||||
- 外部キー制約：channel_idに対して、channels.channelから設定
- 外部キー制約：episode_idに対して、episodes.episode_idから設定
- ユニークキー制約：program_list_title カラムに対して設定

テーブル：series

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|-------|--------|----|---|-----|--------------|
|series_id|int(4)||PRIMARY|1|YES|
|series_title|varchar(100)|||||
- ユニークキー制約：series_title カラムに対して設定

テーブル：seasons

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|-------|--------|----|---|-----|--------------|
|seasons_id|int(4)||PRIMARY|1|YES|
|series_id|int(4)|||||
|season_num|int(2)|||||
|season_title|varchar(100)|||||
- 外部キー制約：series_idに対して、series.series_idから設定

テーブル：episodes

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|-------|--------|----|---|-----|--------------|
|episode_id|int(4)||PRIMARY|1|YES|
|seasons_id|int(4)|YES||||
|episode_title|varchar(100)|||||
|episode_num|int(4)|YES||||
|playback_time|time|||||
|release_date|date|||||
|episode_info|varchar(255)|||||
|episode_views|int(10)|||||
|file_path|varchar(255)|||||
- 外部キー制約：seasons_idに対して、seasons.seasons_idから設定

テーブル：genres

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|-------|--------|----|---|-----|--------------|
|genre_id|int(4)||PRIMARY|1|YES|
|genre_name|varchar(50)|||||
- ユニークキー制約：genre_name カラムに対して設定

テーブル：program_genres

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
|-------|--------|----|---|-----|--------------|
|program_genres_id|int(10)||PRIMARY|1||
|genre_id|int(4)|||||
|program_id|int(10)|||||
- 外部キー制約：genre_idに対して、genres.genre_idから設定
- 外部キー制約：program_idに対して、program_list.program_idから設定
