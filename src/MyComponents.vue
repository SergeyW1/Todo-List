<template>
  <div class="back-conteiner">
    <div class="todo-list">
      <div class="todo-conteiner">
        <div class="todo-list__title">
          <h1>Todo App</h1>
        </div>
        <form @submit.prevent="addTodo" class="todo-list__form">
          <input v-model="newTodo" placeholder="Add your new todo"/>
          <button class="todo-list__add-btn"></button>
        </form>
        <ul>
          <li class="list" v-for="todo in filterTodo" :key="todo.id">
            <div class="list-item">
              <input type="checkbox" v-model="todo.done" class="checked-input"/>
              <label :class="{ done: todo.done }" class="list-item__text">{{ todo.text }}</label>
            </div>
            <div class="close" @click="removeTodo(todo)"></div>
          </li>
        </ul>
        <div>
          <button @click="hideCompleted = !hideCompleted" class="change-btn">
            {{ hideCompleted ? "Show all" : "Hide selected" }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
let id = 0;
export default {
  data() {
    return {
      hideCompleted: false,
      newTodo: "",
      todos: [],
      mainContent: "main-content",
    };
  },
  methods: {
    addTodo() {
      this.todos.push({ id: id++, text: this.newTodo }), 
			(this.newTodo = "");
    },
    removeTodo(item) {
      this.todos = this.todos.filter((t) => t !== item);
    },
  },
  computed: {
    filterTodo() {
      return this.hideCompleted
        ? this.todos.filter((t) => !t.done)
        : this.todos;
    },
  },
};
</script>