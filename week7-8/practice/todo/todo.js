document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('form');
  const todoInput = document.getElementById('todo-input');
  const todoList = document.getElementById('todo-list');

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const view = `<div class="post">
    <li class="todo-item"><input type="checkbox"><span>${todoInput.value}</span><button class="delete-button">削除</button></li>
    </div>`;
    todoList.innerHTML += view;
    todoInput.value = '';
  });

  todoList.addEventListener('click', (event) => {
    if (event.target.classList.contains('delete-button')) {
      const listItem = event.target.parentElement;
      listItem.parentElement.removeChild(listItem);
    }
  });

  todoList.addEventListener('change', (event) => {
    const span = event.target.parentElement.querySelector('span');
    if (event.target.checked) {
      span.style.textDecoration = 'line-through';
    } else {
      span.style.textDecoration = '';
    }
  });
});
