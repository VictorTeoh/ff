  //to do proper images later on use loadShape() look it up
  Player player;
  Bullet[] bullets;
  int[] keys_to_check = { UP, DOWN, LEFT, RIGHT };//
  boolean[] keys_down = new boolean[keys_to_check.length];
  int i;
  
  //current display seems like the higher positive values are at the bottom and
  //negative at the top  
  void setup() {
    fullScreen();    
    //size(600,600);
    frameRate(60);
    background(0);
    noStroke();
    player = new Player(0,0);//move this later
    bullets = new Bullet[1000];
  }
  
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

  void draw() {
    clear();
    for(i = 0; i < bullets.length; i++){
      if(bullets[i] != null){
        shape( bullets[i].gethbox(), bullets[i].getxpos(), bullets[i].getypos());
      }
    }
    shape( player.gethbox(), player.getxpos(), player.getypos());
    //bring the conditon for shooting outside of player, same with shoot
      
      
    player.move();//make play function when menu stuff done
  }