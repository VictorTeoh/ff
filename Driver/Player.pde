class Player extends Character{
  public Player(float xpos, float ypos){
   super(xpos, ypos); 
   ellipse( getxpos(), getypos(), 1.0, 1.0);
  }
  int[] keys_to_check = { UP, DOWN, LEFT, RIGHT };//
  boolean[] keys_down = new boolean[keys_to_check.length];
 
void keyPressed(){
   copeWithKeys(true); // TRUE MEANS KEY PRESSED
}
 
void keyReleased(){
  copeWithKeys(false); // FALSE MEANS KEY NOT PRESSED
}
 
void copeWithKeys(boolean state){
  for( int i = 0; i < keys_to_check.length; i++){
    if( keys_to_check[i] == keyCode ){ keys_down[i] = state; }
  }
}

void move(){//change later
  //current display seems like the higher positive values are at the bottom and
  //negative at the top
  if(keyPressed){
    System.out.println(keyCode);
    xpos = xpos + speed * cos(angle);
    ypos = ypos + speed * sin(angle);
  }
  }
}