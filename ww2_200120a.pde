int xpos=20 , ypos=600  , velocity=0 , gravity=2 , gamekey=0 , shootx , shooty , hp1=100,hp2=100,hp3=100,hp4=100,hp5=100 , es1=960  , es2=1080 , es3=900 , es4=740 , es5=480; 
int myhp=100 , helix=1210 , heliy=0 ,  road=0 , helishootx=helix , helishooty=heliy+80 , bosshp=100 , power=3;
PImage  myman, ground , goal , stage1 , test , lava , enemy1 , enemy2 , aid , main , boss , go1, go2,go3,go4 ,winner,controls;
boolean[] keys=new boolean[2];
boolean shoot=false , shoottime=true , mainpage=true , aidbox=false , game=true;
String hp="Health:" , bhp="BOSS:";
import ddf.minim.*;
Minim minim;
AudioPlayer myshot;
AudioPlayer e1s , e2s ,e3s , e4s , pain1 , pain2 , pain3 , page , heli , helishoot , mehurt , helihurt , helihurt1 , bp , beep;
void  setup()
{
  fullScreen();
  myman=loadImage("soldier.png");
  ground=loadImage("base.png");
  goal=loadImage("poop.png");
  stage1=loadImage("base.png");
  test=loadImage("soldier.png");
  lava=loadImage("lava.jpg");
  enemy1=loadImage("e1.png");
  enemy2=loadImage("e2.png");
  aid=loadImage("box.png");
  main=loadImage("mainpage.jpg");
  boss=loadImage("heli.png");
  go1=loadImage("gameover1.jpg");
  go2=loadImage("gamneover2.jpg");
  go3=loadImage("gameover3.jpg");
  go4=loadImage("gameover4.jpg");
  winner=loadImage("winner.jpg");
  controls=loadImage("controls.jpg");
  minim=new Minim(this);
  myshot=minim.loadFile("myshot.mp3");
  e1s=minim.loadFile("e1.mp3");
  e2s=minim.loadFile("e2.mp3");
  e3s=minim.loadFile("e3.mp3");
  e4s=minim.loadFile("e4.mp3");
  pain1=minim.loadFile("hurt.mp3");
  pain2=minim.loadFile("hurt2.mp3");
  pain3=minim.loadFile("hurt3.mp3");
  page=minim.loadFile("page.mp3");
  heli=minim.loadFile("heli.mp3");
  helishoot=minim.loadFile("hshoot.mp3");
  mehurt=minim.loadFile("hurt3.mp3");
  helihurt=minim.loadFile("helihurt.mp3");
  helihurt1=minim.loadFile("helihurt1.mp3");
  bp=minim.loadFile("bp.mp3");
  beep=minim.loadFile("beep.mp3");
  page.loop();
  keys[0]=false;
  keys[1]=false;
}
void draw()
{
  if(gamekey==0)
  {
    image(main,0,0,width,height);
  }
  if(gamekey==2)
  {
    image(controls,0,0,width,height);
    
  }
  if(gamekey==4)
  {
    image(winner,0,0,width,height);
  }
  if(gamekey==5)
  {
    int a=int(random(3));
    if(game==true)
    {
      game=false;
    if(a==0)
    {
      image(go1,0,0,width,height);
    }
    if(a==1)
    {
      image(go2,0,0,width,height);
    }
    if(a==2)
    {
      image(go3,0,0,width,height);
    }
    if(a==3)
    {
      image(go4,0,0,width,height);
    }
    }
  }
  if(gamekey==1)
  {
    mainpage=false;
  background(0,0,0);
  image(ground,-20,670,300,120);
  image(ground,-20,670,300,120);
  image(ground,1160,670,300,120);
  image(lava,267,710,900,120);
  image(stage1,130,530,100,60);
  image(stage1,310,460,100,60);
  image(stage1,280,230,100,60);
  image(stage1,100,170,100,60);
  image(stage1,220,70,640,60);
  image(stage1,410,340,100,60);
  image(stage1,1070,370,100,60);
  image(stage1,900,150,100,60);
  image(stage1,990,370,100,60);
  image(stage1,1130,460,100,60);
  image(stage1,1270,610,100,60);
  image(myman,xpos,ypos,80,80);
  image(goal,1300,550,50,50);
  image(aid,155,5,30,30);
  fill(255,255,255);
  textSize(20);
  text(power,195,30);
  fill(255,255,255);
   if(myhp<=20)
    {
      fill(255,120,0);
    }
    if(myhp<=10)
    {
      fill(255,0,0);
    }
  textSize(20);
  text(hp,10,30);
  text(myhp,90,30);
  if(myhp<0)
  {
    gamekey=5;
  }
  if(hp1<=0 && hp2<=0 && hp3<=0 && hp4<=0 && hp5<=0 && bosshp<=0)
  {
    if(xpos>=1290 && ypos==540)
    {
      gamekey=4;
    }
  }
  if(hp1<=0 && hp2<=0 && hp3<=0 && hp4<=0 && hp5<=0)
  {
   if(bosshp>0)
   {
     heli.play();
    image(boss,helix,heliy,150,100);
    heli();
    helishoot();
    fill(255,255,255);
    if(bosshp<=20)
    {
      fill(255,120,0);
    }
    if(bosshp<=10)
    {
      fill(255,0,0);
    }
    textSize(20);
    text(bhp,10,75);
    text(bosshp,90,75);
    bosskill();
   }
  }
  else
  {
   if(hp1>0)
   {
    fill(255,255,255);
     if(hp1<=20)
    {
      fill(255,120,0);
    }
    if(hp1<=10)
    {
      fill(255,0,0);
    }
    textSize(20);
    text(hp1,990,260);
    image(enemy1,960,280,100,100);
    if(ypos<=390)
    {
     fill(188,1,2);
     ellipse(es1,315,10,10);
     es1-=35;
     if(es1<=0)
     {
       es1=960;
       e1s.rewind();
       e1s.play();
     }
     if(es1-xpos<=60  &&  es1-xpos>=0 && 315-ypos>=0 &&  315-ypos<=80)
     {
       es1=960;
      ekill();
     }
    }
  }
  if(hp2>0)
  {
   fill(255,255,255);
    if(hp2<=20)
    {
      fill(255,120,0);
    }
    if(hp2<=10)
    {
      fill(255,0,0);
    }
   textSize(20);
   text(hp2,1110,260);
   image(enemy1,1080,280,100,100);
   if(ypos<=390)
   {
     if(es2==1080)
     {
       e2s.rewind();
       e2s.play();
     }
     
    fill(255,123,35);
    ellipse(es2,315,10,10);
    es2-=35;
    if(es2<=0)
    {
     es2=1080;
    }
    if(es2-xpos<=60  &&  es2-xpos>=0 && 315-ypos>=0 &&  315-ypos<=80)
    {
      es2=1080;
     ekill();
    }
   }
  }
  if(hp3>0)
  {
   fill(255,255,255);
    if(hp3<=20)
    {
      fill(255,120,0);
    }
    if(hp3<=10)
    {
      fill(255,0,0);
    }
   textSize(20);
   text(hp3,930,60);
   image(enemy2,900,70,90,90);
   if(ypos<=160)
   {
     if(es3==900)
     {
       e3s.rewind();
       e3s.play();
     }
    fill(188,1,2);
    ellipse(es3,105,10,10);
    es3-=35;
    if(es3<=0)
    {
     es3=900;
    }
    if(es3-xpos<=60  &&  es3-xpos>=0 && 105-ypos>=0 &&  105-ypos<=80)
    {
      es3=900;
     ekill();
    }
   }
  }
  if(hp4>0)
  {
   fill(255,255,255);
    if(hp4<=20)
    {
      fill(255,120,0);
    }
    if(hp4<=10)
    {
      fill(255,0,0);
    }
   textSize(20);
   text(hp4,830,20);
   image(enemy2,740,10,90,90);
   if(ypos<=100)
   {
     if(es4==740)
     {
       e4s.rewind();
       e4s.play();
     }
    fill(188,1,2);
    ellipse(es4,45,10,10);
    es4-=20;
    if(es4<=0)
    {
      es4=740;
    }
    if(es4-xpos<=60  &&  es4-xpos>=0 && 45-ypos>=0 &&  45-ypos<=80)
    {
      es4=740;
      ekill();
    }
   }
  }
  if(hp5>0)
  {
   fill(255,255,255);
    if(hp5<=20)
    {
      fill(255,120,0);
    }
    if(hp5<=10)
    {
      fill(255,0,0);
    }
   textSize(20);
   text(hp5,550,20);
   image(enemy2,480,10,90,90);
   if(ypos<=100)
   {
     if(es5==480)
     {
       e3s.rewind();
       e3s.play();
     }
    fill(255,123,35);
    ellipse(es5,45,10,10);
    es5-=15;
    if(es5<=0)
    {
      es5=480;
    }
    if(es5-xpos<=60  &&  es5-xpos>=0 && 45-ypos>=0 &&  45-ypos<=80)
    {
      es5=480;
      ekill();
    }
   }
  }
 }
 if(power>0)
 {
  image(aid,20,330,50,50);
  if(aidbox==true)
  {
   if(xpos-20<=70 && xpos-20>=-60 && ypos-330>=-70 && ypos-330<=50)
   {
     beep.rewind();
     beep.play();
    myhp+=20;
    if(myhp>100)
    {
      myhp=100;
    }
    power--;
    aidbox=false;
   }
  }
 }
  textSize(20);
  move();
  shoot();
  }
}
void keyPressed()
{
  if(key=='a' || key=='A')
  {
    keys[0]=true;
  }   
  if(key=='d' || key=='D')
  {
    keys[1]=true;
  }
  if(velocity==0)
  {
   if(key=='p' || key=='P')
   {
     up();
     aidbox=true;
   }
   if(key=='k' || key=='K')
   {
     velocity+=-gravity-15;
     ypos+=velocity;
   }
  }
  if(shoottime==true)
  {
   if(key=='l' || key=='L')
   {
     myshot.rewind();
     myshot.play();
     shoot=true;
     shoottime=false;
     shootupdate();
   }
  }
 
  if(mainpage==true)
  {
    if(key=='s' || key=='S')
    {
      bp.rewind();
      bp.play();
      gamekey=1;
      xpos=20;
      ypos=600;
      myhp=100;
      hp1=100;
      hp2=100;
      hp3=100;
      hp4=100;
      hp5=100;
      bosshp=100;
      power=3;
    }
     
  }
  if(key=='b' || key=='B')
  {
    bp.rewind();
    bp.play();
    gamekey=0;
    mainpage=true;
    game=true;
  }
  if(key=='c' || key=='C')
  {
    bp.rewind();
    bp.play();
    gamekey=2;
  }
}
void keyReleased()
{
  if(key=='a' || key=='A')
  {
    keys[0]=false;
  }
  if(key=='d' || key=='D')
  {
    keys[1]=false;
  }
}

void move()
{
  if(keys[0])
  {
    xpos-=10;
  }
  if(keys[1])
  {
    xpos+=10;
  }
  gravity();
  if(ypos>=600)
  {
    ypos=600;
    velocity=0;
  }
  objects();
  //boundary();
}
void gravity()
{
  velocity+=gravity;
  ypos+=velocity;
}
void up()
{
  velocity+=-gravity-20;
  ypos+=velocity;
}
void gameover()
{
  String sms="Game over";
  background(0,0,0);
  textSize(50);
  text(sms,500,500);
  gamekey=3;
}
//void boundary()
//{
//  if(xpos>=1300)
//  {
//    gameover();
//  }
//  if(xpos<=0)
//  {
//    gameover();
//  }
//}
void objects()
{
  if(xpos>=100 && xpos<=190 && ypos>=460 && ypos<=520)
  {
    ypos=460;
    velocity=0;
  }
  if(xpos>=280 && xpos<=360 && ypos>=390 && ypos<=420)
  {
    ypos=390;
    velocity=0;
  }
  if(xpos>=380 && xpos<=460 && ypos>=270 && ypos<=300)
  {
    ypos=270;
    velocity=0;
  }
  if(xpos>=250 && xpos<=350 && ypos>=160 && ypos<=200)
  {
    ypos=160;
    velocity=0;
  }
  if(xpos>=80 && xpos<=170 && ypos>=100 && ypos<=130)
  {
    ypos=100;
    velocity=0;
  }
  if(xpos>=200 && xpos<=800 && ypos>=0 && ypos<=20)
  {
    ypos=0;
    velocity=0;
  }
  if(xpos>=880 && xpos<=960 && ypos>=80 && ypos<=110)
  {
    ypos=80;
    velocity=0;
  }
  if(xpos>=960 && xpos<=1130 && ypos>=300 && ypos<=350)
  {
    ypos=300;
    velocity=0;
  }
  if(xpos>=1120 && xpos<=1190 && ypos>=390 && ypos<=420)
  {
    ypos=390;
    velocity=0;
  }
  
  if(xpos>=1190 && ypos>=540 && ypos<=560)
  {
    ypos=540;
    velocity=0;
  }
  if(xpos>=260&&xpos<=1140 && ypos>=600 && ypos<=800)
  {
    gamekey=5;
  }
}
void shoot()
{
  if(shoot==true)
  {
  fill(255,255,0);
  ellipse(shootx,shooty,10,10);
  shootx+=50;
  if(shootx>=1370)
  {
    shoot=false;
    shoottime=true;
  }
  if(hp1>0)
  {
   if((shootx-960)>=40 && (shootx-960)<=90 && (shooty-280)>=0 && (shooty-280)<=95)
   {
     shoot=false;
     shoottime=true;
     int a=int(random(2));
     if(a==0)
     {
       hp1-=6;
       pain1.rewind();
       pain1.play();
     }
     if(a==1)
     {
       hp1-=5;
       pain2.rewind();
       pain2.play();
     }
     if(a==2)
     {
       hp1-=2;
       pain3.rewind();
       pain3.play();
     }
   }
  }
  if(hp2>0)
  {
     if((shootx-1080)>=40 && (shootx-1080)<=90 && (shooty-280)>=0 && (shooty-280)<=95)
     {
      shoot=false;
      shoottime=true;
      int a=int(random(2));
      if(a==0)
      {
        hp2-=6;
        pain1.rewind();
       pain1.play();
      }
      if(a==1)
      {
        hp2-=5;
        pain2.rewind();
       pain2.play();
      }
      if(a==2)
      {
        hp2-=2;
        pain3.rewind();
       pain3.play();
      }
     }
  }
  if(hp3>0)
  {
      if((shootx-900)>=30 && (shootx-900)<=90 && (shooty-70)>=0 && (shooty-70)<=80)
     {
      shoot=false;
      shoottime=true;
      int a=int(random(2));
      if(a==0)
      {
        hp3-=6;
        pain1.rewind();
       pain1.play();
      }
      if(a==1)
      {
        hp3-=5;
        pain2.rewind();
       pain2.play();
      }
      if(a==2)
      {
        hp3-=2;
        pain3.rewind();
       pain3.play();
      }
     }
  }
  if(hp4>0)
  {
      if((shootx-740)>=30 && (shootx-740)<=90 && (shooty-10)>=0 && (shooty-10)<=80)
     {
      shoot=false;
      shoottime=true;
      int a=int(random(2));
      if(a==0)
      {
        hp4-=6;
        pain1.rewind();
       pain1.play();
      }
      if(a==1)
      {
        hp4-=5;
        pain2.rewind();
       pain2.play();
      }
      if(a==2)
      {
        hp4-=2;
        pain3.rewind();
       pain3.play();
      }
     }
  }
  if(hp5>0)
  {
      if((shootx-480)>=30 && (shootx-480)<=90 && (shooty-10)>=0 && (shooty-10)<=80)
     {
      shoot=false;
      shoottime=true;
      int a=int(random(2));
      if(a==0)
      {
        hp5-=6;
        pain1.rewind();
       pain1.play();
      }
      if(a==1)
      {
        hp5-=5;
        pain2.rewind();
       pain2.play();
      }
      if(a==2)
      {
        hp5-=2;
        pain2.rewind();
       pain2.play();
      }
     }
  }
  }
}
void shootupdate()
{
  shootx=xpos+80;
  shooty=ypos+50;
}
void ekill()
{
  
  int a=int(random(2));
  {
    mehurt.rewind();
    mehurt.play();
    if(a==0)
    {
      myhp-=2;
    }
    if(a==1)
    {
      myhp-=5;
    }
    if(a==2)
    {
      myhp-=10;
    }
  }
}
void heli()
{
  if(road==0)
  {
  heliy+=10;
  }
  if(heliy>=425)
  {
    road=1;
  }
  if(road==1)
  {
    heliy-=10;
  }
  if(heliy<=0)
  {
    road=0;
    heli.rewind();
  }
}
void helishoot()
{
  fill(0,0,255);
  ellipse(helishootx,helishooty,30,30);
  helishootx-=50;
  if(helishootx<=0 )
  {
    helishootx=helix;
    helishooty=heliy+80;
    helishoot.rewind();
    helishoot.play();
  }
  if(helishootx-xpos<=80 && helishootx-xpos>=-20 && helishooty-ypos>=-20 && helishooty-ypos<=100)
  {
    mehurt.rewind();
    mehurt.play();
    helishootx=helix;
    helishooty=heliy+80;
    int a=int(random(2));
    if(a==0)
    {
      myhp-=10;
    }
    if(a==1)
    {
      myhp-=15;
    }
    if(a==2)
    {
      myhp-=8;
    }
  }
}
void bosskill()
{
  if(shootx-helix>=20 && shootx-helix<=150 && shooty-heliy>=0 && shooty-heliy<=90)
  {
    shoot=false;
    shoottime=true;
    shootupdate();
    int a=int (random(2));
    if(a==0)
    {
      helihurt1.rewind();
      helihurt1.play();
      bosshp-=2;
    }
    if(a==1)
    {
       helihurt1.rewind();
      helihurt1.play();
      bosshp-=5;
    }
    if(a==2)
    {
      helihurt1.rewind();
      helihurt1.play();
      bosshp-=8;
    }
  }
}
