public class Hitbox implements box{
  private int len;
  private int wid;
  private int posX;
  private int posY;
  public boolean display;

  
  public Hitbox(int posX_, int posY_, int width_, int length_) {
    noFill();
    stroke(100, 100, 100);
    rect(posX_, posY_, width_, length_);
    len = length_;
    wid = width_;
    posX = posX_;
    posY = posY_;
    display = false;

  }
  
  public boolean checkCollides(character other){
   for (int i = posX; i < posX + wid; i++) {
      if (i == other.posX) {
        for (int j = posY; i < posY + len; j++) {
          if (j == other.posY) {
            return true;
          }
        }
      }
    }
    return false;
  }
 
}
