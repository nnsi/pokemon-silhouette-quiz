<QuizEnd>
<p><b>{result.current_number}</b>問中<b>{result.correct_count}</b>問正解でした！</p>
<p>あなたのランクは<b>{rank}</b>級です！
<p><button onclick={onMoreGameButtonClick}>もう一回やる</button></p>
<style>
p{
  text-align:center;
  margin-bottom:5rem;
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
</style>
<script>
const app=opts.app
const obs=opts.obs
const RANK=[{"rate":0,"name":"モンスターボール"},{"rate":31,"name":"スーパーボール"},{"rate":61,"name":"ハイパーボール"},{"rate":100,"name":"マスターボール"}]

this.result=app.end()
this.rank=RANK.reverse().find(rank=>rank.rate<=Math.floor(this.result.correct_count/this.result.current_number*100)).name

this.on("mount",()=>{
  obs.trigger("title","結果発表")
})

this.onMoreGameButtonClick=()=>{
  obs.trigger("page","quiztop")
}
</script>
</QuizEnd>