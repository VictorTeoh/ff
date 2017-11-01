class Player extends Character{  
  public Player(float xpos, float ypos){
   super(xpos, ypos); 
   hbox = createShape(ELLIPSE, 0, 0, 10, 10);
  // shape( hbox, xpos, ypos);
  }

  void move(){
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
    if(keys_down[2] && keys_down[3] && pkeys_down[1]){ angle = PI/2; System.out.println("#@$%");}
    else if(keys_down[2] && keys_down[3] && pkeys_down[0]){ angle = 3*PI/2; System.out.println("31");}
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
    else if(keys_down[2] && keys_down[3] && pkeys_down[1]){ angle = PI/2; System.out.println("#@$%");}
    else if(keys_down[2] && keys_down[3] && pkeys_down[0]){ angle = 3*PI/2; }
    else if(keys_down[0] && keys_down[1] && pkeys_down[2]){ angle = PI; }
    else if(keys_down[0] && keys_down[1] && pkeys_down[3]){ angle = 0; }
 /*   else if(keys_down[0] && keys_down[1]){ return;}
    else if(keys_down[2] && keys_down[3]){ return;}
   */ else if(pkeys_down[0]){ angle = 3*PI/2; }
    else if(pkeys_down[1]){ angle = PI/2; }
    else if(pkeys_down[2]){ angle = PI; System.out.println("123");}
    else if(pkeys_down[3]){ angle = 0;}
    System.out.println("!@#");
    super.move();
    
  }
  
  void shoot(){
    //System.out.println("QWeqe");
    Bullet shot = new Bullet(this.getxpos(), this.getypos()-5);
    shot.sethbox(createShape(ELLIPSE, 0, 0, 15, 15));
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