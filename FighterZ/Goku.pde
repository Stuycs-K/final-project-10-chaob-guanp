public class Goku extends character {
  //boxes library?
  
  public Goku(int PlayerNumber){
    super(PlayerNumber);
    setSprites("Goku");
  }
  
  public void update(){
    try{
      tickDelay = 75;
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
      else if(!up && down && !light && !medium && !heavy && !special && !inAir && !stunned){ // Crouch
        tickDelay = 150;
        img = tempSprites.get(findLastSprite(10)).getImage();
        image(img, posX + (img.width/2), posY + (height - img.width/2));
      }
      else if(up && !down && !light && !medium && !heavy && !special && !inAir && !stunned){ // Jump, the delays will run in here i guess
        if (left){
        }
        else if (right){
        }
        else{
          int startIndex = findFirstSprite(41);
          int endIndex = findLastSprite(41);
          
          for (int i = 0; i < endIndex - startIndex + 1; i++){
            if (!stunned){
              posY = -1 * (-1 * (int) (Math.pow( ( (2 * Math.sqrt(100) / (double) (endIndex-startIndex) ) * i) - Math.sqrt(100), 2) ) + 100);
              img = tempSprites.get((i % (endIndex - startIndex + 1)) + startIndex).getImage(); // 
              image(img, posX + (img.width/2), posY + (height - img.width/2)); // the posY coord should also account for jump height. 
            }
            Thread.sleep(1);
          }
        }
      }
    
    
      if (posY != 0){
        inAir = true;
      }
      else{
        inAir = false;
      }
      
      ticks++;
      Thread.sleep(tickDelay);
    }
    catch(InterruptedException e){
      print("THREADSLEEP EXCEPTION");
    }
  }
  
  private void jump(String direction){
    
  }
}
