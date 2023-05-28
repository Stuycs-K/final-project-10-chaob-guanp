public class Hitbox extends Box{
  private int len;
  private int wid;
  private int posX;
  private int posY;
  
  public Hitbox(int posX_, int posY_, int width_, int length_) {
    super(posX_, posY_, width_, length_);
    noFill();
    stroke(100, 100, 100);
    rect(posX_, posY_, width_, length_);
  }
}
