import { createApp } from 'vue'
import App from './App.vue'
import MyComponents from './MyComponents'
import '../src/assets/main.css'

const app = createApp(App)

app.component('my-components', MyComponents)
app.mount('#app')
