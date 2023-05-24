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
  
  public boolean checkCollides(box other, int otherXpos, int otherYpos, int Xpos, int Ypos){
    for (int i = Xpos; i < Xpos + wid; i++) {
      if (i == otherXpos) {
        for (int j = Ypos; i < Ypos + len; j++) {
          if (j == otherYpos) {
            return true;
          }
        }
      }
    }
    return false;

  }
 
}
