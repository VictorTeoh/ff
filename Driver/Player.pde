class Player extends Character{  
  public Player(float xpos, float ypos){
   super(xpos, ypos); 
   hbox = createShape(ELLIPSE, 0, 0, 10, 10);
  // shape( hbox, xpos, ypos);
  }

  void move(){
    
    //if you have contradicting movement don't move
    if(keys_down[0] && keys_down[1]){ return; }
    if(keys_down[2] && keys_down[3]){ return; }
      
    //diagonals first
    if(keys_down[0] && keys_down[2]){ angle = 5*PI/4; }
    else if(keys_down[0] && keys_down[3]){ angle = 7*PI/4; }
    else if(keys_down[1] && keys_down[2]){ angle = 3*PI/4; }
    else if(keys_down[1] && keys_down[3]){ angle = PI/4; }
    else if(keys_down[0]){ angle = 3*PI/2; }
    else if(keys_down[1]){ angle = PI/2; }
    else if(keys_down[2]){ angle = PI; }
    else if(keys_down[3]){ angle = 0;}
      
    xpos = xpos + speed * cos(angle);
    ypos = ypos + speed * sin(angle);
    
  }
  
  void shoot(){
    //System.out.println("QWeqe");
    Bullet shot = new Bullet(this.getxpos(), this.getypos()-5);
    shot.sethbox(createShape(ELLIPSE, 0, 0, 15, 15));
    shot.setspeed(10);
    shot.angle = 3*PI/2;
    for(int i = 0; i < bullets.length; i++){
      if(bullets[i] == null){
        bullets[i] = shot;
      }
    }
  }
}