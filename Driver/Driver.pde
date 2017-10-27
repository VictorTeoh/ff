  //to do proper images later on use loadShape() look it up
  Player player;
  Bullet[] bullets;
  int[] keys_to_check = { UP, DOWN, LEFT, RIGHT, SHIFT, 90, 88 };
  //ascii values of z and x
  boolean[] keys_down = new boolean[keys_to_check.length];
  boolean move_key_pressed = false;
  int i;
  
  //current display seems like the higher positive values are at the bottom and
  //negative at the top  
  void setup() {
   // fullScreen();    //0-1370 domain ~ 0-875 range
    size(600,600);
    frameRate(60);
    background(0);
    noStroke();
    player = new Player(0,0);//move this later
    bullets = new Bullet[10];
    /*
    bullets[0] = new Bullet(800, 500);
    bullets[0].setspeed(1);
    bullets[0].sethbox(createShape(ELLIPSE, 0, 0, 100, 100));
    */
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
   //     System.out.println("qwer");
        shape( bullets[i].gethbox(), bullets[i].getxpos(), bullets[i].getypos());
      }
    }
    shape( player.gethbox(), player.getxpos(), player.getypos());
    //bring the conditon for shooting outside of player, same with shoot
      
    //System.out.println(player.getxpos());
    //System.out.println(player.getypos());
    //can be optimized
    for(i = 0; i < 4; i++){//4 is the movement keys
      if(keys_down[i]){
          move_key_pressed = true;
          break;
      }
    }
    if(move_key_pressed){
      player.move();//make play function when menu stuff done
      move_key_pressed = false;//slightly inefficient?
    }
    if(keys_down[5] && bullets[0] == null){
      player.shoot(); 
    }
    if(bullets[0] != null){
    shape( bullets[0].gethbox(), bullets[0].getxpos(), bullets[0].getypos());
    }
  }