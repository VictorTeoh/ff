  //23 pds of work?
  //to do proper images later on use loadShape() look it up
  //optimization everytime something gets removed shift it so then every loop
  // have to go through null indices
  Player player;
  Character enemy;
  Character[] Characters;
  Bullet[] bullets; 
  Bullet[] pbullets;
  int[] keys_to_check = { UP, DOWN, LEFT, RIGHT, SHIFT, 90, 88 };
  //ascii values of z and x respectively
  boolean[] keys_down = new boolean[keys_to_check.length];
  boolean[] pkeys_down = new boolean[keys_to_check.length];
  boolean move_key_pressed = false;
  int i;
  int d;
  
  //current display seems like the higher positive values are at the bottom and
  //negative at the top  
  void setup() {
    //fullScreen();    //0-1370 domain ~ 0-875 range
    size(600,600);
    //surface.setResizable(true); hurdur wt fare u dong
    //surface.setSize(width, height);
    frameRate(60);//note there is already lag at 100 fps pushing the max bullets
    background(0);
    noStroke();
    //move this later when menus are done
    Characters = new Character[200];
    player = new Player(width/2,3*height/4, 10);
    Bullet shot = new Bullet( 30, 3*PI/2, 1, 6, false);
    shot.sethboxrad(10);
    shot.sethbox(createShape(ELLIPSE, 0, 0, 10, 10));//keep as the same as hbox rad

    Bullet[][] allthethings = new Bullet[5][32];
    allthethings[0][0] = shot;
    player.setarsenal(allthethings);
    enemy = new Character(width/2,height/4, 10);
 /*   for( i = 0; i< Characters.length; i++){
       Characters[i] = enemy; 
    }*/
    Characters[0] = enemy;
    enemy.setspeed(0);
    enemy.sethealth(10);
    player.sethealth(1);
    Bullet[][] proto = new Bullet [5][32];
    proto[0][0] = shot.clone();
    proto[0][0].setangle(PI/2);
    proto[0][0].setatkdly(1);
    proto[0][0].setspeed(6);
    proto[0][1] = proto[0][0].clone();
    enemy.setarsenal(proto);
    bullets = new Bullet[2000];
    pbullets = new Bullet[300];
    
  }
  
  float findAngle(float y, float x){
    if(x >= 0 && y >= 0){
       return atan(y/x); 
    }
    if(x >= 0 && y < 0){
       return atan(y/x) + 2*PI; 
    }
    if(x < 0 && y >= 0){
       return atan(y/x) + PI; 
    }
    if(x < 0 && y < 0){
       return atan(y/x) + PI; 
    }
    return 9;
  }
  
  void keyPressed(){
     copeWithKeys(true); // TRUE MEANS KEY PRESSED
  }
 
  void keyReleased(){
     copeWithKeys(false); // FALSE MEANS KEY NOT PRESSED
  }
  
  void copeWithKeys(boolean state){
    for( int i = 0; i< pkeys_down.length; i++){
      pkeys_down[i] = false;
    }
    for( int i = 0; i < keys_to_check.length; i++){
      if( keys_to_check[i] == keyCode ){
         keys_down[i] = state; 
         pkeys_down[i] = state;
      }
    }
  }
  
  void delethethings(){
    for( int i = 0; i < bullets.length; i++){
      if(bullets[i] == null){}
      else if(bullets[i].getypos() < -50.0 || bullets[i].getypos() > height+50.0 ||
      bullets[i].getxpos() < -50.0 || bullets[i].getxpos() > width+50){
        bullets[i] = null;
      }
    }
    for( int i = 0; i < Characters.length; i++){
      if(Characters[i] == null){}
      else if(Characters[i].getypos() < -50.0 || Characters[i].getypos() > height+50.0 ||
      Characters[i].getxpos() < -50.0 || Characters[i].getxpos() > width+50){
        Characters[i] = null;
      }
    }
  }
  
  
  void drawthethings(){
    for(i = 0; i < bullets.length; i++){
      if(bullets[i] != null){
        fill(#ff0000);
        shape( bullets[i].gethbox(), bullets[i].getxpos(), bullets[i].getypos());
      }
    }
    for(i = 0; i < pbullets.length; i++){
      if(pbullets[i] != null){
        fill(#00ff00);
        shape( pbullets[i].gethbox(), pbullets[i].getxpos(), pbullets[i].getypos());
      }
    }
    for(i = 0; i < Characters.length; i++){
      if(Characters[i] != null){
        fill(#ff0000);
        shape( Characters[i].gethbox(), Characters[i].getxpos(), Characters[i].getypos());
      }
    }
    if(Characters[0] == null){ 
      Characters[0] = enemy;
      enemy.setxpos(enemy.getxpos()+1);
      enemy.sethealth(10);
    }
    if(!player.isdead()){
      shape( player.gethbox(), player.getxpos(), player.getypos());
      fill(#ff0000);//idk
    }  
    else{
    ;
    }
  }
  
  void movethethings(){ 
    for(i = 0; i < bullets.length; i++){
      if(bullets[i] != null){
        bullets[i].move();
      }
    }
    for(i = 0; i < pbullets.length; i++){
      if(pbullets[i] != null){
        if(pbullets[i].gethoming()){
          pbullets[i].home(Characters[0]);
        }
        pbullets[i].move();
      }
    }
    for(i = 0; i < Characters.length; i++){
      if(Characters[i] != null){
        Characters[i].move();
      }
    }
    for(i = 0; i < 4; i++){//4 is the movement keys
      if(keys_down[i]){
        move_key_pressed = true;
        break;
      }
    }
    if(keys_down[4]){
      player.focus();
    }
    if(move_key_pressed){
      player.move();//make play function when menu stuff done
      if(player.getypos() < 5.0){ player.setypos(5.0);}
      if(player.getypos() > height-5.0){ player.setypos(height-5.0);}
      if(player.getxpos() < 5.0){ player.setxpos(5.0);}
      if(player.getxpos() > width-5.0){player.setxpos(width-5.0);}
      move_key_pressed = false;
    }
    if(keys_down[4]){
       player.unfocus(); 
    }
  }
  
  //!!!
  void collidethethings(){
    for(i = 0; i < pbullets.length; i++){
      if(pbullets[i] != null){
        for(d = 0; d < Characters.length; d++){
          if(Characters[d] != null && pbullets[i].collision(Characters[d])){//!!!! collision doesnt do damage
              pbullets[i] = null;
              //!!! future add something a bubble of impact so it doesnt look weird
              if(Characters[d].isdead()){ Characters[d] = null; }
            
          }  
        }
      }
    }
    for(d = 0; d < Characters.length; d++){
      if(Characters[d] != null && player.collision(Characters[d])){//!!!! collision doesnt do damage
          Characters[d].sethealth(Characters[d].gethealth() - 25);
          if(Characters[d].isdead()){
            Characters[d] = null; 
          }
      }
    }
    for(i = 0; i < bullets.length; i++){
      //state invincible add `
      if(player != null && bullets[i] != null && bullets[i].collision(player)){
         player.sethealth(0); 
      }
    }
  }
  
  void decrementhedelay(){
    if(!player.ready()){
      player.updatectr(); //move code to character method
    } 
    for(i = 0; i < Characters.length; i++){
       if(Characters[i] != null && !Characters[i].ready()){
         Characters[i].updatectr();
       }
    }
  }
    
  
  //note player can cuck new enemy bullets and might not spawn if there are too many and vice versa
  void pshoot(){
    if(player.ready() && keys_down[5]){ // MOVE ATKDLYCTR OUT 
      player.shoot(); 
    } 
  }
  
  void eshoot(){
    for(i = 0; i < Characters.length; i++){
       if(Characters[i] != null && Characters[i].ready()){ 
         Characters[i].shoot();
       }
    }
  }
    
  
  void draw() {
    clear();
    collidethethings();
    drawthethings();
    delethethings();
    movethethings();
    decrementhedelay(); // prob should check only and work on only first in each array for delay
    //i just have to  maintain that every bullet in a bullet array is supposed to go on the
    //same frame and from the same thing
    pshoot();
    eshoot();
    if(pkeys_down[6] == true){
       setup(); 
    }
  }