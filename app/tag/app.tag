<App>
<h1>{title}</h1>
<div class="container" ref="container" data-is={view} app={app} view={view} opt={opt} obs={obs} />
<footer>
  <p>ポケットモンスター・ポケモン・Pokémonは<br>任天堂・クリーチャーズ・ゲームフリークの登録商標です。
</footer>
<style>
:scope{
  min-height:100vh;
  display:flex;
  flex-direction:column;
}
h1,footer{
  flex-shrink:0;
}
.container{
  flex-grow:1;
  margin:2.5rem 1rem;
}
h1{
  padding:2rem 0;
  text-align:center;
  color:white;
  background:red;
  font-weight:bold;
  font-size:2rem;
}
img{
  max-width:100%;
}
footer{
  width:100%;
  padding:2rem .25rem;
  text-align:center;
  color:white;
  background:red;
  font-size:0.8rem;
}
</style>
<script>
import './top.tag';
import './question.tag';
import './result.tag';
import './end.tag';

this.obs=opts.obs
this.app=opts.QuizApp
this.view="quiztop"
this.title=""
this.opt={}

this.obs.on("title",title=>{
  this.title=title
  this.update()
})

this.obs.on("page",(page,opt)=>{
  this.view=page
  this.opt=(opt)? opt : this.opt
  this.update()
})

window.onerror = e => {
  alert(e)
  if(this.view!=="quiztop") alert("トップ画面に戻ります")
  this.view="quiztop"
  this.update()
}
</script>
</App>