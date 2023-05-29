class Playlist {
  constructor(playlistName) {
    this.playlistName = playlistName;
    this.songs = [];
  }

  addSong(musicName) {
    this.songs.push(musicName);
  }

  removeSong(musicName) {
    const index = this.songs.indexOf(musicName);
    if (index !== -1) {
      this.songs.splice(index, 1);
    }
  }

  play() {
    return `再生中:${this.songs[0]}`;
  }
}

const myPlaylist = new Playlist('お気に入りリスト');
myPlaylist.addSong('Lemon');
myPlaylist.addSong('花束');
console.log(myPlaylist.play()); // 再生中: Lemon
myPlaylist.removeSong('Lemon');
console.log(myPlaylist.play()); // 再生中：花束
