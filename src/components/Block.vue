<template>
  <div class="block">
      <button id="beehive" @click="purchaseThing($event)">buy beehive</button>
      <button id="better" @click="purchaseThing($event)">better beehive</button>
      <button id="mansion" @click="purchaseThing($event)">bee mansion</button>
      <button id="castle" @click="purchaseThing($event)">bee castle</button>
      <button id="village" @click="purchaseThing($event)">bee village</button>
      <button id="town" @click="purchaseThing($event)">bee town</button>
      <button id="city" @click="purchaseThing($event)">bee city</button>
      <button id="beetropolis" @click="purchaseThing($event)">beetropolis</button>
      <button id="world" @click="purchaseThing($event)">world domination</button>
  </div>
</template>

<script>
export default {
    methods:{
        purchaseThing(event){
            this.$emit("buy", event.currentTarget.id)
        }
    }
}
</script>

<style>
    .block{
        width: 400px;
        border-radius: 20px;
        background: rgb(101, 110, 247);
        color:aquamarine;
        text-align: center;
        padding: 100px 0;
        margin: 40px auto;
    }
</style>