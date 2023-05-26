// 2.要素ノードの変更
document.querySelector('h1').textContent = 'シンプルブログ';
// 3.イベントハンドラの設定
document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('post-form');
  const title = document.getElementById('title');
  const content = document.getElementById('content');
  const posts = document.getElementById('posts');

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const view = `<div class="post">
    <h2>入力されたタイトル:${title.value}</h2>
    <p>入力された本文:${content.value}</p>
    </div>`;
    title.value = '';
    content.value = '';

    posts.innerHTML = view + posts.innerHTML;

    // 最初の要素を削除する
    if (posts.childElementCount > 3) {
      posts.removeChild(posts.lastChild);
    }
  });

  form.addEventListener('mouseover', () => {
    form.style.backgroundColor = 'yellow';
  });
  form.addEventListener('mouseout', () => {
    form.style.backgroundColor = 'white';
  });
});
