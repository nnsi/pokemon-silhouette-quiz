<QuizQuestion>
<p><canvas ref="canvas"></canvas><img ref="img"></p>
<virtual if={pokemon_image_url}>
  <ul>
    <li each={choice,i in choices}><label><input type="radio" name="choice" value={i} onchange={onAnswerChange}><span class="text">{choice}</span></label>
  </ul>
  <button onclick={onAnswerClick} disabled={this.answer===null}>回答する</button>
</virtual>
<style>
p{
  text-align:center;
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
  border:1px solid #ffdd66;
  border-radius:5px;
}
.text:hover{
  background:#ffdd66;
  cursor:pointer;
}
input:checked+.text{
  background:#ffdd66;
  font-weight:bold;
}
button{
    display: block;
    min-width: 300px;
    margin: 0 auto;
    padding: 3px 0;
    border: 1px solid red;
    border-radius: 10px;
    color: white;
    background: red;
    font-weight:bold;
    letter-spacing: 2px;
    text-indent: 2px;
    cursor:pointer;
}
button:disabled{
  background:transparent;
  color:red;
  cursor:not-allowed;
}
</style>
<script>
const app=opts.app
const obs=opts.obs
this.quiz=app.getQuestion()
this.statement=this.quiz.statement
this.choices=this.quiz.choices
this.count=app.getCurrentNumber()
this.answer=null
this.pokemon_image_url=""

this.on("before-mount",async ()=>{
  obs.trigger("title",`だ～れだ？`)
  const res=await fetch("./images/"+this.statement+".png")
  const blob=await res.blob()
  const image=new Image()
  image.src=this.pokemon_image_url=URL.createObjectURL(blob)
  image.onload=()=>{
    const canvas=this.refs.canvas
    const ctx=canvas.getContext('2d')
    canvas.width=image.width
    canvas.height=image.height

    ctx.drawImage(image,0,0);
    const imageData=ctx.getImageData(0,0,canvas.clientWidth,canvas.clientHeight)
    const backup=ctx.getImageData(0,0,canvas.clientWidth,canvas.clientHeight)
    const data=imageData.data

    for (let i=0;i<data.length;i+=4) {
      const color=0
      data[i]=data[i+1]=data[i+2]=color
    }
    ctx.putImageData(imageData,0,0)
    const _d=canvas.toDataURL("image/png")
    canvas.style.display="none";
    this.refs.img.src=_d;
    this.update()
  }
})

this.onAnswerChange=(e)=>{
  this.answer=Number(e.target.value)
}

this.onAnswerClick=()=>{
  if(this.answer===null) return alert("回答を選択してください")
  obs.trigger("page","quizresult",{
    "result":app.answer(this.answer),
    "choice":this.choices[this.answer],
    "pokemon_image_url":this.pokemon_image_url
  })
}
</script>
</QuizQuestion>