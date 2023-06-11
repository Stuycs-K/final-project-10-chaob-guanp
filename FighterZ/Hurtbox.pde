public class Hurtbox extends Box{
  
  public int damage;
  public int stun;
  
  public Hurtbox(int offsetX_, int offsetY_, int width_, int height_, String name_, int damage_, int stun_) {
    super(offsetX_, offsetY_, width_, height_, name_);
    damage = damage_;
    stun = stun_;
  }
}
