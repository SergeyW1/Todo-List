<template>
  <div :class="mainContent">
    <h1>Todos</h1>
    <ul>
      <li class="list" v-for="todo in filterTodo" :key="todo.id">
        <div>
          <input type="checkbox" v-model="todo.done" />
          <label :class="{ done: todo.done }">{{ todo.text }}</label>
        </div>
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

.main-content form{
	margin: 20px;
}

.main-content ul {
  padding: 0;
}

.list {
  position: relative;
  padding: 8px;
  width: 260px;
  list-style-type: none;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 40px;
  margin: 10px 0;
}

.list span {
  font-size: 21px;
}

.close {
  position: relative;
  height: 30px;
  width: 30px;
  cursor: pointer;
  border-radius: 50%;
  opacity: 0.2;
  background-color: red;
  -webkit-transition: opacity ease 0.5s;
  transition: opacity ease 0.5s;
}

.close:hover {
  opacity: 1;
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
	cursor: pointer;
  padding: 10px;
  font-size: 20px;
  border-radius: 5px;
  outline: none;
  border: 2px solid #1a191f;
}
</style>