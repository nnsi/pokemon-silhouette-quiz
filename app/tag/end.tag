<QuizEnd>
<p>成績は{result.correct_count} / {result.current_number}でした！</p>
<p><button onclick={onMoreGameButtonClick}>もう一回やる</button></p>
<script>
const app=opts.app
const obs=opts.obs
this.result=app.end()

this.on("mount",()=>{
  obs.trigger("title","結果発表")
})

this.onMoreGameButtonClick=()=>{
  obs.trigger("page","quiztop")
}
</script>
</QuizEnd>