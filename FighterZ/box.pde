public class Box{
  public Rectangle rectangle;
  public int ht;
  public int wid;
  public int posX; // bottom left
  public int posY; // bottom down
  
  public Box(int posX_, int posY_, int width_, int height_){
    rectangle = new Rectangle(posX_, posY_, width_, height_);
    posX = posX_;
    posY = posY_ - (int) rectangle.getHeight();
    
  }
  
  /*
  public boolean checkCollides(character other){
    for (int i = posX; i < posX + wid; i++) {
      if (i == other.posX) {
        for (int j = posY; i < posY + ht; j++) {
          if (j == other.posY) {
            return true;
          }
        }
      }
    }
    return false;
  }
  */
}
