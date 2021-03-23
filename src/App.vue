<template>
  <div>
    <div>
      <label class="switch">
        <input @change="darkModeToggle" type="checkbox">
        <span class="slider"></span>
      </label>
    </div>
    <h1>bees are pretty cool</h1>
    <h2>{{gameData.bees}} bees</h2>
    <button @click="getBees()" :disabled="!gameData.isBee">MAKE BEE</button>
    <h4 style="color: red;" :hidden="gameData.isBee">need more beehives to make more bee</h4>
    <h2>{{gameData.score}} honey</h2>
    <h4 style="color: #{{fontColor}}">{{gameData.perSecond}}/s</h4>
    <div class="container" style="width: 50%; display: inline-block;">
      <div v-for="resource in gameData.resources" :key="resource.name" class="row" style="display: inline-block; width: 10em; padding: 1%">
        <div class="hex" style="background: {{}}; display: inline-block; width: 100%;">
          <div style="color:tomato">{{resource.cost}}</div>
          <button class="button" style="width:80%" :disabled="(gameData.score < resource.cost)" @click="resource.count++; resource.cost=Math.round(resource.cost*1.1);gameData.score = gameData.score-resource.cost; gameData.isBee = true; gameData.bees = gameData.bees + resource.rate">{{resource.name}}</button>
          <div style="color: yellowgreen;">{{resource.count}}</div>
          <div style="font-size: 10px;">{{resource.rate/4 * resource.count}}/s</div>
        </div>
      </div>
    </div>
    <h5>bee has travelled: {{gameData.miles}}px</h5>
    <h2>{{compliment}}</h2>
    <img class="image" :style="{top: imgTop, left: imgLeft, height:'100px', position: 'absolute', transform: flip, transition: 'ease 1s'}" src="./assets/bee.gif" alt="bee">
  </div>
</template>

<script>
import json from './assets/compliments.json'
export default {
  name: 'App',
  created(){
    this.interval = setInterval(() => this.makeHoney(), 250)
  },
  //save the game to local storage
  mounted(){
    if(localStorage.gameData){
      this.gameData = JSON.parse(localStorage.gameData)
    }
  },
  watch:{
    gameData:{
      handler(newgameData){
        localStorage.gameData = JSON.stringify(newgameData);
      },
      //deep means that the 'watch' gets called when nested data is updated
      deep: true
    }
  },
  data(){
    return{
      fontColor: 262626,
      compliments: json,
      compliment: null,
      imgLeft: null,
      imgTop: null,
      flip: null,
      rotation: null,
      gameData:{
        resources: {
          //the buttons are dynamic, so the more resources you add, the bigger the game
          beehive:{
            name: "beehive",
            cost: 30,
            rate: 1,
            count: 1
          },
          better:{
            name: "better hive",
            cost: 100,
            rate: 10,
            count: 0
          },
          mansion:{
            name: "mansion",
            cost: 800,
            rate: 80,
            count: 0
          },
          castle:{
            name: "castle",
            cost: 3000,
            rate: 200,
            count: 0
          },
          village:{
            name: "village",
            cost: 20000,
            rate: 1000,
            count: 0
          },
          town:{
            name: "town",
            cost: 100000,
            rate: 8000,
            count: 0
          },
          city:{
            name: "city",
            cost: 1250000,
            rate: 100000,
            count: 0
          },
          beetropolis:{
            name: "beetropolis",
            cost: 15000000,
            rate: 500000,
            count: 0
          },
          planet:{
            name: "planet",
            cost: 100000000,
            rate: 1000000,
            count: 0
          }
        },
      miles: 0,
      bees: 0,
      perSecond: 0,
      isBee: true,
      score: 0,
      gameOver: false,
      }
    }
  },
  methods:{
    //add bees on click
    getBees(){
      var imgWidth = Math.round(Math.random() * window.innerWidth)-100
      var imgHeight = Math.round(Math.random() * window.innerHeight)-100
      var num = Math.random() < 0.5 ? -1 : 1
      var rnum = Math.round(Math.random() * 1000)
            //move the bee
      if(this.gameData.bees%6 == 1){
        this.imgLeft = `${imgWidth}px`
        this.imgTop = `${imgHeight}px`
        this.gameData.miles = this.gameData.miles + imgWidth + imgHeight
        this.flip = `scaleX(${num})`
        this.rotation = `rotate(${rnum})`
      }
            //WIN THE GAME
      if(this.gameData.resources.planet.count > 10){
        alert("YOU WIN! Thank you for playing Bee Game v1.0.1 - More updates coming soon...")
      }
      //cycle through compliments
      var compNum = Math.round(Math.random() * 100)
      var c = this.compliments
      this.compliment = c.anytime[compNum]
      this.gameData.bees++
      if(this.gameData.resources.beehive.count <= this.gameData.bees / 100 && this.gameData.resources.better.count < 1){
        this.gameData.isBee = false;
      }
    },
    //this runs every 0.25s and controls the bee + number updates
    makeHoney(){
      //calculate the score per second
      this.gameData.score = Math.round(this.gameData.score + this.gameData.perSecond/4)
      this.gameData.perSecond = this.gameData.bees / 4
    },
    //because our poor eyes can't handle modern technology
    darkModeToggle(){
      var element = document.body
      element.classList.toggle("dark-theme")
      if(this.fontColor == "525252"){
        this.fontColor = "e6e6e6"
        console.log(this.fontColor)
      }
      else{
        this.fontColor = "525252"
        console.log(this.fontColor)
      }
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  margin-top: 60px;
}
body {
  transition: ease 1s;
  color: rgb(66, 66, 66);
  background: rgb(255, 232, 156);
}
a {
  color: #0033cc;
}
/* Dark Mode styles */
body.dark-theme {
  transition: ease 1s;
  color: rgb(255, 200, 82);
  background: #181818;
}
body.dark-theme a {
  color: #809fff;
}
 /* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}
/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}
/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}
.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}
input:checked + .slider {
  background-color: #2196F3;
}
input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}
input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}
/* Tooltip container */
.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
   /* If you want dots under the hoverable text */
}
/* Tooltip text */
.tooltip .tooltiptext {
  visibility: hidden;
  transition:ease-out 1s;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  padding: 5px 0;
  border-radius: 6px;
  /* Position the tooltip text - see examples below! */
  position: absolute;
  z-index: 1;
}
/* Show the tooltip text when you mouse over the tooltip container */
.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>