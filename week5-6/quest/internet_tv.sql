-- 1.データベースを作成します。
CREATE DATABASE internet_tv;

-- 2.使用するデータベースinternet_tvを選択します。
USE internet_tv;

-- 3.各テーブルを作成します。

-- channels テーブルの作成
CREATE TABLE channels (
  channel_id INT(10) NOT NULL AUTO_INCREMENT,
  channel_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (channel_id),
  UNIQUE (channel_name)
);

-- series テーブルの作成
CREATE TABLE series (
  series_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  series_title VARCHAR(100) NOT NULL,
  PRIMARY KEY (series_id),
  UNIQUE (series_title)
);

-- seasons テーブルの作成
CREATE TABLE seasons (
  season_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  series_id BIGINT(20) NOT NULL,
  season_num INT(2) NOT NULL,
  season_title VARCHAR(100) NOT NULL,
  PRIMARY KEY (season_id),
  FOREIGN KEY (series_id) REFERENCES series(series_id)
);

-- episodes テーブルの作成
CREATE TABLE episodes (
  episode_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  season_id BIGINT(20),
  episode_title VARCHAR(100) NOT NULL,
  episode_num INT(4),
  playback_time TIME NOT NULL,
  release_date DATE NOT NULL,
  episode_info VARCHAR(255),
  episode_views INT(10) NOT NULL,
  file_path VARCHAR(255) NOT NULL,
  PRIMARY KEY (episode_id),
  FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

-- program_list テーブルの作成
CREATE TABLE program_list (
  program_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  channel_id INT(10) NOT NULL,
  episode_id BIGINT(20) NOT NULL,
  program_list_title VARCHAR(100) NOT NULL,
  start_datetime DATETIME NOT NULL,
  end_datetime DATETIME NOT NULL,
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
  program_genres_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  genre_id INT(4) NOT NULL,
  program_id BIGINT(20) NOT NULL,
  PRIMARY KEY (program_genres_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
  FOREIGN KEY (program_id) REFERENCES program_list(program_id)
);

-- 4.各テーブルに対し、サンプルデータを投入します。

-- channelsテーブルにデータを挿入
INSERT INTO channels (channel_name)
VALUES ('チャンネル1'), ('チャンネル2'), ('チャンネル3');

-- seriesテーブルにデータを挿入
INSERT INTO series (series_title)
VALUES ('シリーズA'), ('シリーズB'), ('シリーズC'), ('シリーズD'), ('シリーズE'), ('シリーズF'), ('シリーズG'), ('シリーズH');

-- genresテーブルにデータを挿入
INSERT INTO genres (genre_name)
VALUES ('アニメ'), ('ドラマ'), ('スポーツ');

-- seasonsテーブルにデータを挿入
INSERT INTO seasons (series_id, season_num, season_title)
VALUES (1, 1, 'シリーズA - シーズン1'),
       (1, 2, 'シリーズA - シーズン2'),
       (2, 1, 'シリーズB - シーズン1'),
       (2, 2, 'シリーズB - シーズン2'),
       (3, 1, 'シリーズC - シーズン1'),
       (4, 1, 'シリーズD - シーズン1'),
       (5, 1, 'シリーズE - シーズン1'),
       (6, 1, 'シリーズF - シーズン1');

-- episodesテーブルにデータを挿入
INSERT INTO episodes (season_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path)
VALUES (1, 'エピソード1', 1, '00:30:00', '2023-05-01', 'シリーズA - シーズン1 - エピソード1', 100, 'file1.mp4'),
       (1, 'エピソード2', 2, '00:30:00', '2023-05-02', 'シリーズA - シーズン1 - エピソード2', 80, 'file2.mp4'),
       (2, 'エピソード1', 1, '01:00:00', '2023-05-03', 'シリーズB - シーズン1 - エピソード1', 120, 'file3.mp4'),
       (2, 'エピソード2', 2, '01:00:00', '2023-05-04', 'シリーズB - シーズン1 - エピソード2', 95, 'file4.mp4'),
       (3, 'エピソード1', 1, '02:00:00', '2023-05-05', 'シリーズC - シーズン1 - エピソード1', 130, 'file5.mp4'),
       (4, 'エピソード1', 1, '02:00:00', '2023-05-06', 'シリーズD - シーズン1 - エピソード1', 110, 'file6.mp4'),
       (5, 'エピソード1', 1, '00:30:00', '2023-05-07', 'シリーズE - シーズン1 - エピソード1', 90, 'file7.mp4'),
       (5, 'エピソード2', 2, '00:30:00', '2023-05-08', 'シリーズE - シーズン1 - エピソード2', 85, 'file8.mp4'),
       (6, 'エピソード1', 1, '01:00:00', '2023-05-09', 'シリーズF - シーズン1 - エピソード1', 140, 'file9.mp4'),
       (6, 'エピソード2', 2, '01:00:00', '2023-05-10', 'シリーズF - シーズン1 - エピソード2', 120, 'file10.mp4');

-- program_listテーブルにデータを挿入
INSERT INTO program_list (channel_id, episode_id, program_list_title, start_datetime, end_datetime, program_list_info, program_list_views)
VALUES (1, 1, 'チャンネル1 - エピソード1', '2023-05-01 19:00:00', '2023-05-01 19:30:00', 'シリーズA - シーズン1 - エピソード1 on チャンネル1', 50),
       (1, 2, 'チャンネル1 - エピソード2', '2023-05-02 19:00:00', '2023-05-02 19:30:00', 'シリーズA - シーズン1 - エピソード2 on チャンネル1', 40),
       (2, 3, 'チャンネル2 - エピソード1', '2023-05-03 19:00:00', '2023-05-03 20:00:00', 'シリーズB - シーズン1 - エピソード1 on チャンネル2', 60),
       (2, 4, 'チャンネル2 - エピソード2', '2023-05-04 19:00:00', '2023-05-04 20:00:00', 'シリーズB - シーズン1 - エピソード2 on チャンネル2', 55),
       (3, 5, 'チャンネル3 - エピソード1', '2023-05-05 19:00:00', '2023-05-05 21:00:00', 'シリーズC - シーズン1 - エピソード1 on チャンネル3', 70),
       (3, 6, 'チャンネル3 - エピソード2', '2023-05-06 19:00:00', '2023-05-06 21:00:00', 'シリーズD - シーズン1 - エピソード1 on チャンネル3', 65),
       (1, 7, 'チャンネル1 - エピソード3', '2023-05-07 19:00:00', '2023-05-07 19:30:00', 'シリーズE - シーズン1 - エピソード1 on チャンネル1', 45),
       (1, 8, 'チャンネル1 - エピソード4', '2023-05-08 19:00:00', '2023-05-08 19:30:00', 'シリーズE - シーズン1 - エピソード2 on チャンネル1', 42),
       (2, 9, 'チャンネル2 - エピソード3', '2023-05-09 19:00:00', '2023-05-09 20:00:00', 'シリーズF - シーズン1 - エピソード1 on チャンネル2', 58),
       (2, 10, 'チャンネル2 - エピソード4', '2023-05-10 19:00:00', '2023-05-10 20:00:00', 'シリーズF - シーズン1 - エピソード2 on チャンネル2', 52);

-- program_genresテーブルにデータを挿入
INSERT INTO program_genres (genre_id, program_id)
VALUES (1, 1), (1, 2), (2, 3), (2, 4), (3, 5),
       (3, 6), (1, 7), (1, 8), (2, 9), (2, 10);
