class Player extends Character{  
  float focuspeed = speed/4;
  public Player(float xcord, float ycord, float nspeed){
   super(xcord, ycord, nspeed); 
   hboxrad = 10;
   hbox = createShape(ELLIPSE, 0, 0, hboxrad, hboxrad);
  // shape( hbox, xpos, ypos);
  }
  
  void focus(){
     speed = focuspeed; 
  }
  
  void unfocus(){
     speed = 4*speed; 
  }  
  
  void move(){
    //System.out.println("qwe");
    //change later if it feels bad
    //if you have contradicting movement don't move
    /*
    if(keys_down[0] && keys_down[1] && keys_down[2] && keys_down[3]){ return; }
    else if(keys_down[2] && keys_down[3] && keys_down[1]){ angle = PI/2; }
    else if(keys_down[2] && keys_down[3] && keys_down[0]){ angle = 3*PI/2; }
    else if(keys_down[0] && keys_down[1] && keys_down[2]){ angle = PI; }
    else if(keys_down[0] && keys_down[1] && keys_down[3]){ angle = 0; }
    else if(keys_down[0] && keys_down[1]){ return;}
    else if(keys_down[2] && keys_down[3]){ return;}*/
    //diagonals first with pkeys
    if(keys_down[2] && keys_down[3] && pkeys_down[1]){angle = PI/2; }/*System.outrintln("#@$%")*/
    else if(keys_down[2] && keys_down[3] && pkeys_down[0]){ angle = 3*PI/2;}/* System.o.println("31")*/
    else if(keys_down[0] && keys_down[1] && pkeys_down[2]){ angle = PI; }
    else if(keys_down[0] && keys_down[1] && pkeys_down[3]){ angle = 0; }
    else if(keys_down[0] && keys_down[2]){
       angle = 5*PI/4;
       if(pkeys_down[1]){ angle = PI/2; }
       else if(pkeys_down[3]){ angle = 0; }
     }
    else if(keys_down[0] && keys_down[3]){ 
       angle = 7*PI/4;
       if(pkeys_down[1]){ angle = PI/2; }
       else if(pkeys_down[2]){ angle = PI; }
     }
    else if(keys_down[1] && keys_down[2]){ 
       angle = 3*PI/4;
       if(pkeys_down[0]){ angle = 3*PI/2; }
       else if(pkeys_down[3]){ angle = 0; } 
     }
    else if(keys_down[1] && keys_down[3]){
       angle = PI/4;
       if(pkeys_down[0]){ angle = 3*PI/2; }
       else if(pkeys_down[2]){ angle = PI; } 
     }
     //
    else if(keys_down[2] && keys_down[3] && pkeys_down[1]){angle = PI/2; /*System.outrintln("#@$%")*/;}
    else if(keys_down[2] && keys_down[3] && pkeys_down[0]){ angle = 3*PI/2; }
    else if(keys_down[0] && keys_down[1] && pkeys_down[2]){ angle = PI; }
    else if(keys_down[0] && keys_down[1] && pkeys_down[3]){ angle = 0; }
 /*   else if(keys_down[0] && keys_down[1]){ return;}
    else if(keys_down[2] && keys_down[3]){ return;}
   */ else if(keys_down[0]){ angle = 3*PI/2; }
    else if(keys_down[1]){ angle = PI/2; }
    else if(keys_down[2]){ angle = PI; /*System.ouprintln("123")*/}
    else if(keys_down[3]){ angle = 0;}
    //System.out.println(this.getspeed());
    super.move();
      
  }
  
  void shoot(){
    //System.out.println("QWeqe");
    Bullet shot = new Bullet(this.getxpos(), this.getypos()-5, 30);
    //! make this into a constructor)
    shot.sethboxrad(15);
    shot.sethbox(createShape(ELLIPSE, 0, 0, 15, 15));//keep as the same as hbox rad
    shot.setspeed(30);
    shot.angle = 3*PI/2;
    for(int i = 0; i < bullets.length; i++){
      if(bullets[i] == null){
        bullets[i] = shot;
        break;
      }
    }
  }
}