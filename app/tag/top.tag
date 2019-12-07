<QuizTop>
<div>
  <h2>出題範囲</h2>
  <ul>
    <li each={genres}><label><input type="radio" name="choice" onchange={onSelectRangeClick.bind(this,id)}><span class="text">{name}</span></label>
  </ul>
  <p><button onclick={onQuizStartClick} disabled={this.genre_id===null}>クイズを始める</button>
</li>
<style>
:scope{
  max-width:400px;
}
h2{
  text-align:center;
  font-size:1.8rem;
}
ul{
  margin:1.25rem auto 1.5rem auto;
  max-width:400px;
  list-style:none;
}
input{
  display:none;
}
.text{
  display:block;
  margin-top:.25rem;
  padding:.25rem;
  text-align:center;
  border:1px solid black;
  border-radius:5px;
}
.text:hover{
  background:black;
  color:white;
  cursor:pointer;
}
input:checked+.text{
  background:black;
  color:white;
  font-weight:bold;
}
button{
  display: block;
  min-width: 300px;
  margin: 0 auto;
  padding: 3px 0;
  border: 1px solid #ffdd66;
  border-radius: 10px;
  background: #ffdd66;
  color:black;
  font-weight:bold;
  letter-spacing: 2px;
  text-indent: 2px;
  cursor:pointer;
}
button:disabled{
  background:transparent;
  cursor:not-allowed;
}
</style>
<script>
const app=opts.app
const obs=opts.obs
this.genres=app.getGenre()
this.genre_id=null

this.on("before-mount",()=>{
  obs.trigger("title","だ～れだ！")
})

this.onSelectRangeClick=(id)=>{
  this.genre_id=id
}

this.onQuizStartClick=()=>{
  if(this.genre_id===null){
    return alert("ジャンルを選択してください")
  }
  if(app.initialize(this.genre_id)){
    obs.trigger("page","quizquestion")
  }
}
</script>

</QuizTop>