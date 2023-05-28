public class Hurtbox extends Box{
  private int len;
  private int wid;
  private int posX;
  private int posY;
  
  public Hurtbox(int posX_, int posY_, int width_, int length_) {
    super(posX_, posY_, width_, length_);
    noFill();
    stroke(255, 0, 0);
    rect(posX_, posY_, width_, length_);
  }
}
