class Player extends Character{  
  float focuspeed = speed/4;
  //for later
  int lvl;
  int xp;
  int lives;
  int bombs;
  
  public Player(float xcord, float ycord, float nspeed){
   super(xcord, ycord, nspeed); 
   hboxrad = 10;
   hbox = createShape(ELLIPSE, 0, 0, hboxrad, hboxrad);
   health = 1;
  // shape( hbox, xpos, ypos);
  }
  
  void focus(){
     speed = focuspeed; 
  }
  
  void unfocus(){// a necessary evil i think because i dont want to set a  new focus speed
  //but it becomes unflexible, make set focus speed function and make it constant not speed/4
     speed = 4*speed; 
  }  
  
  void move(){
    //Future fix, it feels fine for now but fix contradicting moves
    //probably can be cleaned up
    //System.out.println("qwe");
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
    Bullet shot = new Bullet(this.getxpos(), this.getypos() - 10, 30);
    //! make this into a constructor with all the stuff here or not? nah you need to
    //cuz everysingle different bullet will have to look like this
    //still don't know how to work with weird shaped stuff without overkilling on coverage
    shot.sethboxrad(15);
    shot.sethbox(createShape(ELLIPSE, 0, 0, 15, 15));//keep as the same as hbox rad
    shot.setspeed(20);
    shot.setangle(3*PI/2);
    //shot.targetangle(Characters[0]);
    shot.sethoming(true);
    shot.setdmg(1);
    for(int i = 0; i < bullets.length; i++){ // move out of shoot and make it a condition
      if(bullets[i] == null){
        bullets[i] = shot;
        break;
      }
    }//that sets bullets[i] to the return value of shoot
  }
}