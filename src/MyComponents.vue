<template>
  <div :class="mainContent">
    <h1>Todos</h1>
    <ul class="list">
      <li v-for="todo in filterTodo" :key="todo.id">
        <input type="checkbox" v-model="todo.done" />
        <span :class="{ done: todo.done }">{{ todo.text }}</span>
        <div class="close" @click="removeTodo(todo)"></div>
      </li>
    </ul>
    <form @submit.prevent="addTodo">
      <input v-model="newTodo" />
    </form>
    <button @click="hideCompleted = !hideCompleted">
      {{ hideCompleted ? "Показать все" : "Скрыть выделенные" }}
    </button>
  </div>
</template>

<script>
let id = 0;
export default {
  data() {
    return {
      hideCompleted: false,
      newTodo: "",
      todos: [{ id: id++, text: "Привет я за****" }],
      mainContent: "main-content",
    };
  },
  methods: {
    addTodo() {
      this.todos.push({ id: id++, text: this.newTodo }), (this.newTodo = "");
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
<style>
.done {
  text-decoration: line-through;
}
.main-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 95vh;
  margin: 0 auto;
  max-width: 350px;
}

.list {
  padding: 0;
  width: 50%;
  list-style-type: none;
}

.list li {
  position: relative;
}

.close {
  position: absolute;
  height: 30px;
  width: 30px;
  top: 4px;
  right: 4px;
  cursor: pointer;
  border-radius: 50%;
  opacity: 0.2;
  background-color: red;
  -webkit-transition: opacity ease 0.5s;
  transition: opacity ease 0.5s;
}

.close::before,
.close::after {
  position: absolute;
  content: "";
  width: 22px;
  height: 2px;
  background-color: white;
  display: block;
  top: 14px;
  right: 4px;
}

.close::after {
  transform: rotate(45deg);
}

.close::before {
  transform: rotate(-45deg);
}

input {
  padding: 10px 30px;
  font-size: 15px;
}
</style>