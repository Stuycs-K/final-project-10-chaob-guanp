public class Hurtbox implements box{
  private int len;
  private int wid;
  private int posX;
  private int posY;
  
  public Hurtbox(int length_, int width_, int posX_, int posY_) {
    rect(posX_, posY_, width_, length_);
    len = length_;
    wid = width_;
    posX = posX_;
    posY = posY_;
  }
  
  public box checkCollides(){
    return null;
  }
}
