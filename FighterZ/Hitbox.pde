public class Hitbox implements box{
  private int len;
  private int wid;
  private int posX;
  private int posY;
  
  public Hitbox(int posX_, int posY_, int width_, int length_) {
    noFill();
    stroke(100, 100, 100);
    rect(posX_, posY_, width_, length_);
    len = length_;
    wid = width_;
    posX = posX_;
    posY = posY_;
  }
  
  public boolean checkCollides(Hitbox other){
    if (other.posX + other.wid == posX+wid && other.posY + other.len == posY + len){
        return true;
    }
    else {
      return false;
    }
  }
}
