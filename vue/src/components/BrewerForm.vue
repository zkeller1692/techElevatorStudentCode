<template>
  <div>
    <button @click="toggleForm()">Add New Brewer</button>
    <form class="brewer-form" v-show="this.showForm">
      <h1>Add Brewer Form</h1>

      <label for="username">Username:</label><br />
      <select name="username" id="username" v-model="brewer.brewerId">
        <option :value="user.id" v-for="user in filterUsers" :key="user.id">
          {{ user.username }}
        </option></select
      ><br />

      <label for="brewery">Brewery Name:</label><br />
      <select name="brewery" id="brewery" v-model="brewer.breweryId">
        <option
          :value="brewery.id"
          v-for="brewery in this.$store.state.breweries"
          :key="brewery.id"
        >
          {{ brewery.name }}
        </option></select
      ><br />
      <button @click.prevent="submitBrewer">Submit</button>
    </form>
  </div>
</template>

<script>
// update user role to brewer
// add userid and breweryid to brewer table
import BrewerService from "../services/BrewerService";

export default {
  created() {
    this.$store.commit("GET_LIST_BREWERY");
    this.$store.commit("GET_LIST_USER");
  },
  data() {
    return {
      brewer: {
        brewerId: -1,
        breweryId: -1,
      },
      showForm: false,
    };
  },
  methods: {
    submitBrewer() {
      console.log(this.brewer);
      BrewerService.createBrewer(this.brewer);
    //   BrewerService.switchToBrewer()
      alert("The user appointed as Brewer successfully")
    },
    toggleForm() {
      this.showForm = !this.showForm;
    },
  },
  computed: {
      filterUsers() {
        let arr = [];
        this.$store.state.users.forEach(user => {
            user.authorities.forEach(authority => {
                if(authority.name == "ROLE_USER"){
                    arr.push(user)
                }
            })
        });
        return arr;        
  }
  },
}
</script>
