public interface character{
  public void normalAttack();
  public void superAttack();
  public void specialAttack();
  public void update();
  public void setSprites(String keyword);
  public ArrayList<MyPImage> getSprites();
  public void setKeybinds();
  public char[] getKeybinds();
  public void playerSwap(char keybind);
}
