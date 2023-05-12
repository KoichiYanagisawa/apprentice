-- 1. よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
SELECT
    episode_title,
    episode_views
FROM
    episodes
INNER JOIN
    program_list ON episodes.episode_id = program_list.episode_id
ORDER BY
    episode_views DESC
LIMIT 3;

-- 2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
SELECT
    program_list_title,
    season_num,
    episode_num,
    episode_title,
    episode_views
FROM
    episodes
INNER JOIN
    program_list ON episodes.episode_id = program_list.episode_id
INNER JOIN
    seasons ON episodes.season_id = seasons.season_id
ORDER BY
    episode_views DESC
LIMIT 3;

-- 3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします
SELECT
    channel_name,
    start_datetime,
    end_datetime,
    season_num,
    episode_num,
    episode_title,
    episode_info
FROM
    program_list
INNER JOIN
    channels ON channels.channel_id = program_list.channel_id
INNER JOIN
    episodes ON episodes.episode_id = program_list.episode_id
INNER JOIN
    seasons ON seasons.season_id = episodes.season_id
WHERE
    DATE(start_datetime) = CURRENT_DATE
ORDER BY
    start_datetime;

-- 4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
SELECT
    channel_name, start_datetime, end_datetime, season_num, episode_num, episode_title, episode_info
FROM
    program_list
INNER JOIN
    program_genres ON program_genres.program_id = program_list.program_id
INNER JOIN
    genres ON genres.genre_id = program_genres.genre_id
INNER JOIN
    channels ON channels.channel_id = program_list.channel_id
INNER JOIN
    episodes ON episodes.episode_id = program_list.episode_id
INNER JOIN
    seasons ON seasons.season_id = episodes.season_id
WHERE
    DATE(start_datetime) BETWEEN CURRENT_DATE() AND CURRENT_DATE() + INTERVAL 7 DAY
    AND genre_name = 'ドラマ';
