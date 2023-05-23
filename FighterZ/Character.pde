public interface character{
  public void normalAttack();
  public void superAttack();
  public void specialAttack();
  public void changeKeybinds();
  public void update();
  public void setSprites(String keyword);
  public ArrayList<PImage> getSprites();
  public void playerSwap(char keybind);
}
