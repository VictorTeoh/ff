class Character extends Object{
  float health;
  Bullet [][] arsenal;
  //why the fuck does player need dmg  move it to bullet and separate the classes
  //give Character a bullet array array? 
  //need moar constructors
  
  //add hboxrad angle add a new constructor for health remove dmg from character
  //and move it to bullet
  Character( float xcord, float ycord, float nspeed){
     super( xcord, ycord, nspeed);
  }
  
  float gethealth(){
     return health; 
  }
  
  Bullet[][] getarsenal(){
     return arsenal; 
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
    //idk
  }
}