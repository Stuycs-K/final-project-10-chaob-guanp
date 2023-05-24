public class Goku extends character {
  private int crouchTicks;
  private int jumpTicks;
  //boxes library?
  
  public Goku(int PlayerNumber){
    super(PlayerNumber);
    setSprites("Goku");
    crouchTicks = 0;
    jumpTicks = 0;
  }
  
  public void update(){
    ticks++;
    imageMode(CENTER);
    PImage img;
    ArrayList<MyPImage> tempSprites = getSprites();
    if (!(up ^ down) && !(right ^ left) && !light && !medium && !heavy && !special && !inAir && !crouching && !stunned){ // Idle
      int startIndex = findFirstSprite(0);
      int endIndex = findLastSprite(0);
      
      if (ticks > endIndex - startIndex){
        ticks = 0;
      }
      
      img = tempSprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage(); // 
      image(img, posX + (img.width/2), posY + (height - img.width/2)); // the posY coord should also account for jump height. 
    }
    else if(!(up ^ down) && (right ^ left) && !light && !medium && !heavy && !special && !inAir && !crouching && !stunned){ // Left and right walk
      if (right){
        posX+=5;
      }
      else{
        posX-=5;
      }
      int startIndex = findFirstSprite(20);
      int endIndex = findLastSprite(20);
      
      if (ticks > endIndex - startIndex){
        ticks = 0;
      }
      
      img = tempSprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage(); // 
      image(img, posX + (img.width/2), posY + (height - img.width/2)); // the y coord should also account for jump height. 
      
      if (posX + img.width >= width){
        posX = width - img.width;
      }
      if (posX <= 0){
        posX = 0;
      }
    }
    else if(!up && down && !(right ^ left) && !light && !medium && !heavy && !special && !inAir && !stunned){ // Crouch
      if (crouchTicks < 2){
        int startIndex = findFirstSprite(10);
        int endIndex = findLastSprite(10);
        
        if (ticks > endIndex - startIndex){
          ticks = 0;
        }
        
        img = tempSprites.get((ticks % (endIndex - startIndex + 1)) + startIndex).getImage();
        image(img, posX + (img.width/2), posY + (height - img.width/2));
        crouchTicks += 1;
      }
      else{
        img = tempSprites.get(findLastSprite(10)).getImage();
        image(img, posX + (img.width/2), posY + (height - img.width/2));
      }
    }
    else if(!up && !down && !(right ^ left) && !light && !medium && !heavy && !special && !inAir && crouching && !stunned){ // Getting up from crouch
      int startIndex = findFirstSprite(10);
      int endIndex = findLastSprite(10);
      
      img = tempSprites.get((crouchTicks % (endIndex - startIndex + 1)) + startIndex).getImage();
      image(img, posX + (img.width/2), posY + (height - img.width/2));
      crouchTicks -= 1;
    }
    
    else if(!up && !down && (right || left) && !light && !medium && !heavy && !special && !crouching && !stunned){
      
    }
    
    
    if (posY != 0){
      inAir = true;
    }
    else{
      inAir = false;
    }
    
    if (posY == 0 && down){
      if (crouchTicks >= 2){
        crouching = true;
      }
    }
    else if (crouchTicks <= 0){
      crouching = false;
    }
    
    print(ticks + " ");
  }
  
  private void jump(String direction){
    
  }
}
