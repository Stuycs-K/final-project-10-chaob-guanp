public class Goku extends character {
  
  //boxes library?
  
  public Goku(int PlayerNumber){
    super(PlayerNumber);
    setSprites("Goku");
  }
  
  public void update(){
    imageMode(CENTER);
    PImage img;
    if (!up && !left && !down && !right && !light && !medium && !heavy && !special && posY == 0 && !stunned){
      img = getSprites().get(ticks % 7 + 0).getImage(); // modulo by how many sprites there are for a "movement", and add based on which sprites you want to jump to
      image(img, posX + (img.width/2), posY + (height - img.width/2)); // the y coord should also account for jump height. 
    }
    else if(
    /*
    else{
      img = sprites.get(0).getImage(); // for compilation;
    }
    image(img, posX + (img.width/2), posY + (height - img.width/2)); // the y coord should also account for jump height. 
    */
  }
}
