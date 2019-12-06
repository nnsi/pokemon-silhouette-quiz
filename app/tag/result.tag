<QuizResult>
<p><img ref="image"><br>{result.correct_answer}</p>
<p>「{choice}」は…{(result.result) ? "正解" : "不正解"}でした！</p>
<p><button onclick={onNextButtonClick}>次へ</button>
<style>
p{
  margin:1.5rem auto 0 auto;
  max-width:400px;
}
p:first-child{
  margin-top:0;
  text-align:center;
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
    font-weight:bold;
    letter-spacing: 2px;
    text-indent: 2px;
    cursor:pointer;
}
</style>
<script>
const app=opts.app
const obs=opts.obs
this.result=opts.opt.result
this.choice=opts.opt.choice
this.pokemon_image_url=opts.opt.pokemon_image_url
this.count=app.getCurrentNumber()
this.isGameEnd=app.isGameEnd()

this.on("before-mount",()=>{
  obs.trigger("title",`第${this.count}問`)
})
this.on("mount",()=>{
  this.refs.image.src=this.pokemon_image_url
})

this.onNextButtonClick=()=>{
  if(app.isGameEnd()) obs.trigger("page","quizend")
  else obs.trigger("page","quizquestion")
}
</script>
</QuizResult>