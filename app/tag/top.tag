<QuizTop>
<div>
  <p>出題範囲の選択:
    <select ref="genre">
      <option each={genres} value={id}>{name}</option>
    </select>
    <button onclick={onQuizStartClick}>クイズを始める</button>
</div>
<style>
p{
  text-align:center;
}
</style>
<script>
const app=opts.app
const obs=opts.obs
this.genres=app.getGenre()

this.on("before-mount",()=>{
  obs.trigger("title","だ～れだ！")
})

this.onQuizStartClick=()=>{
  if(!this.refs.genre.value){
    return alert("ジャンルを選択してください")
  }
  if(app.initialize(this.refs.genre.value)){
    obs.trigger("page","quizquestion")
  }
}
</script>

</QuizTop>