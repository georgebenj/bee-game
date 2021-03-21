<template>
  <h1>bees are pretty cool</h1>
  <h2>{{bees}} bees</h2>
  <button @click="getBees" :disabled="!isBee">MAKE BEE</button>
  <h4 style="color: red" :hidden="isBee">need bigger beehive to make more bee</h4>
  <h2>{{score}} honey</h2>
  <h4>{{perSecond}}/s</h4>
  <img class="image" :style="{top: imgTop, left: imgLeft, height:'100px', position: 'absolute', transform: flip, transition: 'ease 1s'}" src="./assets/bee.gif" alt="bee">
  <Block v-if="isPlaying" @buy="buyHive"/>
  <h6>beehives:{{bhive}}</h6>
  <h6>better beehives:{{bbhive}}</h6>
  <h6>mansions: {{mansion}}</h6>
  <h2>HOW FAR HAS BEE TRAVELLED: {{miles}}</h2>
  <h2>{{compliment}}</h2>
</template>

<script>


import json from './assets/compliments.json'
import Block from './components/Block.vue'

export default {
  created() {
    this.interval = setInterval(() => this.makeHoney(), 1000)},
  name: 'App',
  components: { Block },
  data() {
    return {
      compliments: json,
      isPlaying: true,
      delay: null,
      score: 1,
      bees: 0,
      isBee: true,
      perSecond: 0,
      bhive: 1,
      bbhive: 0,
      mansion: 0,
      castle: 0,
      village: 0,
      town: 0,
      city: 0,
      beetropolis: 0,
      world: false,
      imgLeft: null,
      imgTop: null,
      flip: null,
      rotation: null,
      miles: 0,
      compliment: null
    }
  },
  methods: {
    start(){
      this.delay = 2000 + Math.random() * 5000;
      this.isPlaying = true
    },
    getBees(){
      var compNum = Math.round(Math.random() * 100)
      var c = this.compliments
      this.compliment = c.anytime[compNum]


      if(this.bhive <= this.bees/100 && this.bbhive == 0){
          this.isBee = false
      }
      if(this.isBee){
        this.bees ++
      }
      else if(this.bhive == 0){
        this.isBee = false
      }
    },
    makeHoney(){
      var num = Math.random() < 0.5 ? -1 : 1
      var rnum = Math.round(Math.random() * 1000)
      var imgWidth = Math.round(Math.random() * window.innerWidth)-100
      var imgHeight = Math.round(Math.random() * window.innerHeight)-100


      this.perSecond = this.bees / 4
      this.score = this.score + this.perSecond
      if(this.bees%4 == 1){
        this.imgLeft = `${imgWidth}px`
        this.imgTop = `${imgHeight}px`
        this.miles = this.miles + imgWidth + imgHeight
        this.flip = `scaleX(${num})`
        this.rotation = `rotate(${rnum})`
      }
    },
     buyHive(type){

       if(type == "beehive"){
         if(this.score > 300 && this.bhive < 5){
           this.score = this.score - 300
           this.isBee = true
           this.bhive++
         }
         else if(this.score > 300 && this.bhive > 4){
           alert("mum says you can only have 5")
         }
         else{
           alert("Beehives cost 300")
         }
       }

       if(type == "better"){
         if(this.score > 3000 && this.bbhive < 5){
           this.score = this.score - 3000
           this.isBee = true
           this.bbhive++
           this.bees = this.bees + 300
         }
         else if(this.score > 3000 && this.bbhive > 4){
           alert("mum says you can only have 5")
         }
         else{
           alert("Better hives cost 3000")
         }
       }

       if(type == "mansion" && this.mansion < 5){
         if(this.score > 20000){
           this.score = this.score - 20000
           this.isBee = true
           this.mansion++
           this.bees = this.bees + 2000
         }
        else if(this.score > 20000 && this.mansion > 4){
           alert("mum says you can only have 5")
         }
         else{
           alert("Mansions cost 20000")
         }
       }
      if(type == "castle" && this.castle < 5){
         if(this.score > 100000){
           this.score = this.score - 100000
           this.isBee = true
           this.castle++
           this.bees = this.bees + 8000
         }
        else if(this.score > 100000 && this.castle > 4){
           alert("mum says you can only have 5")
         }
         else{
           alert("Castles cost 100,000")
         }
       }
      if(type == "village" && this.village < 5){
         if(this.score > 1000000){
           this.score = this.score - 1000000
           this.isBee = true
           this.village++
           this.bees = this.bees + 20000
         }
        else if(this.score > 1000000 && this.village > 4){
           alert("mum says you can only have 5")
         }
         else{
           alert("Villages cost 1m")
         }
       }
      if(type == "town" && this.town < 5){
         if(this.score > 5000000){
           this.score = this.score - 5000000
           this.isBee = true
           this.town++
           this.bees = this.bees + 100000
         }
        else if(this.score > 5000000 && this.town > 4){
           alert("mum says you can only have 5")
         }
         else{
           alert("Towns cost 5m")
         }
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
  color: #444;
  margin-top: 60px;
}
</style>

