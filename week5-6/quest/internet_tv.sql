-- 1.データベースを作成します。
CREATE DATABASE internet_tv;

-- 2.使用するデータベースinternet_tvを選択します。
USE internet_tv;

-- 3.各テーブルを作成します。

-- channels テーブルの作成
CREATE TABLE channels (
  channel_id INT(4) NOT NULL AUTO_INCREMENT,
  channel_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (channel_id),
  UNIQUE (channel_name)
);

-- series テーブルの作成
CREATE TABLE series (
  series_id INT(4) NOT NULL AUTO_INCREMENT,
  series_title VARCHAR(100) NOT NULL,
  PRIMARY KEY (series_id),
  UNIQUE (series_title)
);

-- seasons テーブルの作成
CREATE TABLE seasons (
  seasons_id INT(4) NOT NULL AUTO_INCREMENT,
  series_id INT(4) NOT NULL,
  season_num INT(2) NOT NULL,
  season_title VARCHAR(100) NOT NULL,
  PRIMARY KEY (seasons_id),
  FOREIGN KEY (series_id) REFERENCES series(series_id)
);

-- episodes テーブルの作成
CREATE TABLE episodes (
  episode_id INT(4) NOT NULL AUTO_INCREMENT,
  seasons_id INT(4),
  episode_title VARCHAR(100) NOT NULL,
  episode_num INT(4),
  playback_time TIME NOT NULL,
  release_date DATE NOT NULL,
  episode_info VARCHAR(255),
  episode_views INT(10) NOT NULL,
  file_path VARCHAR(255) NOT NULL,
  PRIMARY KEY (episode_id),
  FOREIGN KEY (seasons_id) REFERENCES seasons(seasons_id)
);

-- program_list テーブルの作成
CREATE TABLE program_list (
  program_id INT(10) NOT NULL AUTO_INCREMENT,
  channel_id INT(4) NOT NULL,
  episode_id INT(4) NOT NULL,
  program_list_title VARCHAR(100) NOT NULL,
  playback_datetime DATETIME NOT NULL,
  program_list_info VARCHAR(255),
  program_list_views INT(10) NOT NULL,
  PRIMARY KEY (program_id),
  FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
  FOREIGN KEY (episode_id) REFERENCES episodes(episode_id),
  UNIQUE (program_list_title)
);

-- genres テーブルの作成
CREATE TABLE genres (
  genre_id INT(4) NOT NULL AUTO_INCREMENT,
  genre_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (genre_id),
  UNIQUE (genre_name)
);

-- program_genres テーブルの作成
CREATE TABLE program_genres (
  program_genres_id INT(10) NOT NULL AUTO_INCREMENT,
  genre_id INT(4) NOT NULL,
  program_id INT(10) NOT NULL,
  PRIMARY KEY (program_genres_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
  FOREIGN KEY (program_id) REFERENCES program_list(program_id)
);

-- 4.各テーブルに対し、サンプルデータを投入します。

-- channels
INSERT INTO channels (channel_name) VALUES ('ドラマ');
INSERT INTO channels (channel_name) VALUES ('アニメ');
INSERT INTO channels (channel_name) VALUES ('バラエティ');
INSERT INTO channels (channel_name) VALUES ('ドキュメンタリー');

-- series
INSERT INTO series (series_title) VALUES ('ドラマA');
INSERT INTO series (series_title) VALUES ('ドラマB');
INSERT INTO series (series_title) VALUES ('アニメA');
INSERT INTO series (series_title) VALUES ('アニメB');
INSERT INTO series (series_title) VALUES ('ドラマC');
INSERT INTO series (series_title) VALUES ('アニメC');
INSERT INTO series (series_title) VALUES ('バラエティA');
INSERT INTO series (series_title) VALUES ('ドキュメンタリーA');

-- seasons
INSERT INTO seasons (series_id, season_num, season_title) VALUES (1, 1, 'ドラマA シーズン1');
INSERT INTO seasons (series_id, season_num, season_title) VALUES (1, 2, 'ドラマA シーズン2');
INSERT INTO seasons (series_id, season_num, season_title) VALUES (2, 1, 'ドラマB シーズン1');
INSERT INTO seasons (series_id, season_num, season_title) VALUES (3, 1, 'アニメA シーズン1');
INSERT INTO seasons (series_id, season_num, season_title) VALUES (4, 1, 'アニメB シーズン1');
INSERT INTO seasons (series_id, season_num, season_title) VALUES (5, 1, 'ドラマC シーズン1');
INSERT INTO seasons (series_id, season_num, season_title) VALUES (6, 1, 'アニメC シーズン1');
INSERT INTO seasons (series_id, season_num, season_title) VALUES (7, 1, 'バラエティA シーズン1');
INSERT INTO seasons (series_id, season_num, season_title) VALUES (8, 1, 'ドキュメンタリーA シーズン1');

-- episodes
INSERT INTO episodes (seasons_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path) VALUES (1, 'ドラマA シーズン1 エピソード1', 1, '00:45:00', '2023-05-11', 'ドラマA シーズン1 エピソード1の詳細', 5000, 'filepath1');
INSERT INTO episodes (seasons_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path) VALUES (1, 'ドラマA シーズン1 エピソード2', 2, '00:45:00', '2023-05-12', 'ドラマA シーズン1 エピソード2の詳細', 4800, 'filepath2');
INSERT INTO episodes (seasons_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path) VALUES (2, 'ドラマA シーズン2 エピソード1', 1, '00:45:00', '2023-05-13', 'ドラマA シーズン2 エピソード1の詳細', 5500, 'filepath3');
INSERT INTO episodes (seasons_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path) VALUES (3, 'ドラマB シーズン1 エピソード1', 1, '00:45:00', '2023-05-14', 'ドラマB シーズン1 エピソード1の詳細', 5300, 'filepath4');
INSERT INTO episodes (seasons_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path) VALUES (5, 'ドラマC シーズン1 エピソード1', 1, '00:45:00', '2023-05-16', 'ドラマC シーズン1 エピソード1の詳細', 4000, 'filepath6');
INSERT INTO episodes (seasons_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path) VALUES (6, 'アニメC シーズン1 エピソード1', 1, '00:30:00', '2023-05-17', 'アニメC シーズン1 エピソード1の詳細', 4500, 'filepath7');
INSERT INTO episodes (seasons_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path) VALUES (7, 'バラエティA シーズン1 エピソード1', 1, '01:00:00', '2023-05-18', 'バラエティA シーズン1 エピソード1の詳細', 4700, 'filepath8');
INSERT INTO episodes (seasons_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path) VALUES (8, 'ドキュメンタリーA シーズン1 エピソード1', 1, '01:30:00', '2023-05-19', 'ドキュメンタリーA シーズン1 エピソード1の詳細', 4200, 'filepath9');

-- genres
INSERT INTO genres (genre_name) VALUES ('ドラマ');
INSERT INTO genres (genre_name) VALUES ('アニメ');
INSERT INTO genres (genre_name) VALUES ('バラエティ');
INSERT INTO genres (genre_name) VALUES ('ドキュメンタリー');

-- program_list
INSERT INTO program_list (channel_id, episode_id, program_list_title, playback_datetime, program_list_info, program_list_views) VALUES (1, 1, 'ドラマA シーズン1 エピソード1', '2023-05-11 20:00:00', 'ドラマA シーズン1 エピソード1の詳細', 5000);
INSERT INTO program_list (channel_id, episode_id, program_list_title, playback_datetime, program_list_info, program_list_views) VALUES (1, 2, 'ドラマA シーズン1 エピソード2', '2023-05-12 20:00:00', 'ドラマA シーズン1 エピソード2の詳細', 4800);
INSERT INTO program_list (channel_id, episode_id, program_list_title, playback_datetime, program_list_info, program_list_views) VALUES (1, 3, 'ドラマA シーズン2 エピソード1', '2023-05-13 20:00:00', 'ドラマA シーズン2 エピソード1の詳細', 5500);
INSERT INTO program_list (channel_id, episode_id, program_list_title, playback_datetime, program_list_info, program_list_views) VALUES (1, 4, 'ドラマB シーズン1 エピソード1', '2023-05-14 20:00:00', 'ドラマB シーズン1 エピソード1の詳細', 5300);
INSERT INTO program_list (channel_id, episode_id, program_list_title, playback_datetime, program_list_info, program_list_views) VALUES (1, 5, 'ドラマC シーズン1 エピソード1', '2023-05-16 20:00:00', 'ドラマC シーズン1 エピソード1の詳細', 4000);
INSERT INTO program_list (channel_id, episode_id, program_list_title, playback_datetime, program_list_info, program_list_views) VALUES (2, 6, 'アニメC シーズン1 エピソード1', '2023-05-17 19:00:00', 'アニメC シーズン1 エピソード1の詳細', 4500);
INSERT INTO program_list (channel_id, episode_id, program_list_title, playback_datetime, program_list_info, program_list_views) VALUES (3, 7, 'バラエティA シーズン1 エピソード1', '2023-05-18 21:00:00', 'バラエティA シーズン1 エピソード1の詳細', 4700);
INSERT INTO program_list (channel_id, episode_id, program_list_title, playback_datetime, program_list_info, program_list_views) VALUES (4, 8, 'ドキュメンタリーA シーズン1 エピソード1', '2023-05-19 22:00:00', 'ドキュメンタリーA シーズン1 エピソード1の詳細', 4200);

-- program_genres
INSERT INTO program_genres (genre_id, program_id) VALUES (1, 1);
INSERT INTO program_genres (genre_id, program_id) VALUES (1, 2);
INSERT INTO program_genres (genre_id, program_id) VALUES (1, 3);
INSERT INTO program_genres (genre_id, program_id) VALUES (1, 4);
INSERT INTO program_genres (genre_id, program_id) VALUES (1, 5);
INSERT INTO program_genres (genre_id, program_id) VALUES (2, 6);
INSERT INTO program_genres (genre_id, program_id) VALUES (3, 7);
INSERT INTO program_genres (genre_id, program_id) VALUES (4, 8);
