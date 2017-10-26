class Player extends Character{  
  public Player(float xpos, float ypos){
   super(xpos, ypos); 
   hbox = createShape(ELLIPSE, 0, 0, 10, 10);
   shape( hbox, getxpos(), getypos());
  }

  void move(){
    boolean move_key_pressed = false;
    int i;
    
    for(i = 0; i < 4; i++){//4 is the movement keys
      if(keys_down[i]){
          move_key_pressed = true;
          break;
      }
    }
    
    if(move_key_pressed){
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
  }
  
  void shoot(){
     Bullet shot = new Bullet(getxpos(), getypos());
     bullets[0] = shot;
  }
}