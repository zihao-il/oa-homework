import { createRouter, createWebHistory } from "vue-router";
import SignIn from "../views/Signin.vue";
import Main from "../views/Main.vue";
import Welcome from "../views/welcome.vue";
import User from "../components/User.vue";
import Contact from "../components/Contact.vue";
import Joblog from "../components/Joblog.vue";
import Meeting from "../components/Meeting.vue";
import Message from "../components/Message.vue";
import Notice from "../components/Notice.vue";
import Schedule from "../components/Schedule.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: "/", redirect: "/signin" },
    {
      path: "/signin",
      component: SignIn,
    },
    {
      path: "/main",
      component: Main,
      redirect: "/welcome",
      children: [
        { path: "/welcome", component: Welcome },
        { path: "/user", component: User },
        { path: "/contact", component: Contact },
        { path: "/joblog", component: Joblog },
        { path: "/meeting", component: Meeting },
        { path: "/message", component: Message },
        { path: "/notice", component: Notice },
        { path: "/schedule", component: Schedule },
      ],
    },
  ],
});
router.beforeEach((to, from, next) => {
  if (to.path === "/signin") return next();
  const token = window.localStorage.getItem("token");
  if (!token) {
    return next("/signin");
  }
  next();
});

export default router;
