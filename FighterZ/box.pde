public class Box{
  private int len;
  private int wid;
  private int posX;
  private int posY;
  
  public Box(int posX_, int posY_, int width_, int length_){
    len = length_;
    wid = width_;
    posX = posX_;
    posY = posY_;
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
