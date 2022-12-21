<template>
  <form @submit.prevent="addTodo">
    <input v-model="newTodo" />
    <button>Add Todo</button>
  </form>
  <ul>
    <li v-for="todo in filterTodo" :key="todo.id">
      <input type="checkbox" v-model="todo.done" />
      <span :class="{ done: todo.done }">{{ todo.text }}</span>
      <button @click="removeTodo(todo)">X</button>
    </li>
  </ul>
  <button @click="hideCompleted = !hideCompleted">
    {{ hideCompleted ? "Показать все" : "Скрыть выделенные" }}
  </button>
</template>

<script>
let id = 0;
export default {
  data() {
    return {
      hideCompleted: false,
      newTodo: "",
      todos: [{id: id++, text: 'Vue'}],
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
</style>