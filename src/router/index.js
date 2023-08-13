import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Welcome page',
      component:  () => import('../pages/WelcomePage.vue')
    }
  ]
})

export default router
