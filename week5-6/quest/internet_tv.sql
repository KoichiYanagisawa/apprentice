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
  FOREIGN KEY (season_id) REFERENCES seasons(seasons_id)
);

-- program_list テーブルの作成
CREATE TABLE program_list (
  program_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  channel_id INT(10) NOT NULL,
  episode_id BIGINT(20) NOT NULL,
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
  program_genres_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  genre_id INT(4) NOT NULL,
  program_id INT(10) NOT NULL,
  PRIMARY KEY (program_genres_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
  FOREIGN KEY (program_id) REFERENCES program_list(program_id)
);

-- 4.各テーブルに対し、サンプルデータを投入します。

-- channelsテーブルにデータを挿入
INSERT INTO channels (channel_name)
VALUES ('Channel 1'), ('Channel 2'), ('Channel 3');

-- seriesテーブルにデータを挿入
INSERT INTO series (series_title)
VALUES ('Series A'), ('Series B'), ('Series C'), ('Series D'), ('Series E'), ('Series F'), ('Series G'), ('Series H');

-- genresテーブルにデータを挿入
INSERT INTO genres (genre_name)
VALUES ('Drama'), ('Comedy'), ('Action');

-- seasonsテーブルにデータを挿入
INSERT INTO seasons (series_id, season_num, season_title)
VALUES (1, 1, 'Series A - Season 1'),
       (1, 2, 'Series A - Season 2'),
       (2, 1, 'Series B - Season 1'),
       (2, 2, 'Series B - Season 2'),
       (3, 1, 'Series C - Season 1'),
       (4, 1, 'Series D - Season 1'),
       (5, 1, 'Series E - Season 1'),
       (6, 1, 'Series F - Season 1');

-- episodesテーブルにデータを挿入
INSERT INTO episodes (season_id, episode_title, episode_num, playback_time, release_date, episode_info, episode_views, file_path)
VALUES (1, 'Episode 1', 1, '00:42:00', '2023-01-01', 'Series A - Season 1 - Episode 1', 100, 'file1.mp4'),
       (1, 'Episode 2', 2, '00:45:00', '2023-01-08', 'Series A - Season 1 - Episode 2', 80, 'file2.mp4'),
       (2, 'Episode 1', 1, '00:50:00', '2023-02-01', 'Series B - Season 1 - Episode 1', 120, 'file3.mp4'),
       (2, 'Episode 2', 2, '00:48:00', '2023-02-08', 'Series B - Season 1 - Episode 2', 95, 'file4.mp4'),
       (3, 'Episode 1', 1, '00:55:00', '2023-03-01', 'Series C - Season 1 - Episode 1', 130, 'file5.mp4'),
       (4, 'Episode 1', 1, '00:53:00', '2023-04-01', 'Series D - Season 1 - Episode 1', 75, 'file6.mp4');

-- program_listテーブルにデータを挿入
INSERT INTO program_list (channel_id, episode_id, program_list_title, playback_datetime, program_list_info, program_list_views)
VALUES (1, 1, 'Channel 1 - Episode 1', '2023-05-01 20:00:00', 'Series A - Season 1 - Episode 1 on Channel 1', 50),
       (1, 2, 'Channel 1 - Episode 2', '2023-05-08 20:00:00', 'Series A - Season 1 - Episode 2 on Channel 1', 40),
       (2, 3, 'Channel 2 - Episode 1', '2023-05-02 21:00:00', 'Series B - Season 1 - Episode 1 on Channel 2', 60),
       (2, 4, 'Channel 2 - Episode 2', '2023-05-09 21:00:00', 'Series B - Season 1 - Episode 2 on Channel 2', 55),
       (3, 5, 'Channel 3 - Episode 1', '2023-05-03 22:00:00', 'Series C - Season 1 - Episode 1 on Channel 3', 70);

-- program_genresテーブルにデータを挿入
INSERT INTO program_genres (genre_id, program_id)
VALUES (1, 1), (1, 2), (2, 3), (2, 4), (3, 5);
