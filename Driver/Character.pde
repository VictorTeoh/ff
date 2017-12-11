class Character extends Object{
  float health;
  Bullet [][] arsenal;
  int lvl;
  //why the fuck does player need dmg  move it to bullet and separate the classes
  //give Character a bullet array array? 
  //need moar constructors
  
  //add hboxrad angle add a new constructor for health remove dmg from character
  //and move it to bullet
  Character( float xcord, float ycord, float nspeed){
     super( xcord, ycord, nspeed);
     lvl = 0;
  }
  
  Character( float xcord, float ycord, float cxcord, float cycord, float nspeed, float nrspeed){
     super( xcord, ycord, cxcord, cycord, nspeed, nrspeed);
     lvl = 0;
  }
  
  float gethealth(){
     return health; 
  }
  
  Bullet[][] getarsenal(){
     return arsenal; 
  }
  
  int getlvl(){
     return lvl; 
  }
    
  void sethealth(float newhealth){
     health = newhealth;
  }
  
  void setarsenal(Bullet[][] newarsenal){
     arsenal = newarsenal; 
  }
  
  boolean isdead(){
      if(health <= 0){ return true;}
      return false; 
  }
  
  
  void shoot(){
    float r;
    r = random(-PI, PI);
    for(int i = 0; arsenal[lvl][i] != null && i < arsenal[lvl].length; i++){
       for(int f = 0; f < bullets.length; f++){ 
          if(bullets[f] == null){
            Bullet shot = arsenal[lvl][i].clone();
            shot.setxpos(this.getxpos() + r*15/PI); 
            shot.setypos(this.getypos() + r*15/PI);
            shot.setangle(random(2*PI));
            shot.setspeed(random(3, 8));
            bullets[f] = shot;
            if(i == 0){
              arsenal[lvl][i].setatkdlyctr(0);
            }
            break;
          }
       }
    }
  }
  
  boolean ready(){
     return arsenal[lvl][0].ready();
  }
  
  void updatectr(){
     arsenal[lvl][0].updatectr(); 
  }
  
  boolean collision(Character other){
      boolean statement = ((this.gethboxrad() + other.gethboxrad())/2) >= dist_to_chara(other);
      if(statement){ other.sethealth(other.gethealth() - 25); }//changed
      return(statement);
  }
}