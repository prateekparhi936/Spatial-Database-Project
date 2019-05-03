let a=4,r=1,R=8;
let x=0,y=0;
for (let i = 0.0; i < Math.PI * 16; i+=0.1) {
    x=((R+r)*Math.cos((r/R)*i)-a*Math.cos((1+r/R)*i))*0.0001+34.021449;
    y=((R+r)*Math.sin((r/R)*i)-a*Math.sin((1+r/R)*i))*0.0001+(-118.289053);
    console.log(y+","+x+","+0);
}

//COORDINATES OF SGM : (34.021,-118.289);