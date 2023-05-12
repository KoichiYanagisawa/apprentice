よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
select episode_title, episode_views from episodes inner join program_list on episodes.episode_id=program_list.episode_id order by episode_views desc limit 3;
よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
select program_list_title, season_num, episode_num, episode_title, episode_views from episodes inner join program_list on episodes.episode_id=program_list.episode_id inner join seasons on episodes.season_id=seasons.season_id order by episode_views desc limit 3;
