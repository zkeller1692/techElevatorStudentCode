<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div> <br>
      <section>
        <label for="username" class="sr-only">Username</label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        />
      </section>
      
      <section>
        <label for="password" class="sr-only">Password</label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        />
      </section>

      <section>
        <label for="password" class="sr-only">Confirm Password</label>
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required
        />
      </section>
      
      <section>
        <label for="email" class="sr-only">Email Address</label>
        <input
          type="email"
          id="email"
          class="form-control"
          placeholder="Email Address"
          v-model="user.email"
          required
        />
      </section>

      <section>
        <label for="ZipCode" class="sr-only">ZipCode</label>
        <input
          type="text"
          id="ZipCode"
          class="form-control"
          placeholder="ZipCode"
          v-model="user.zipCode"
          required
        />
      </section>
      
      <section>
        <button class="btn btn-lg btn-primary btn-block" type="submit">
          Create Account
        </button>
        <br>
        <router-link class="badge bg-secondary" :to="{ name: 'login' }">Have an account?</router-link>
      </section>
      
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
        email:'',
        zipCode:''
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              if(error.response.data.message == "User Already Exists."){
                this.registrationErrorMsg = "That username is already taken. 😔";
              } else{
                this.registrationErrorMsg = 'Bad Request: Validation Errors';
              }
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
  #register{
    margin:1em 4em;
    padding:1em 3em;
    background: #ffffff80;
    border-radius: 15px;
  }
  section, button{
    margin-bottom: 1em;
  }
  section label{
    margin-right: 1em;
  }
</style>
