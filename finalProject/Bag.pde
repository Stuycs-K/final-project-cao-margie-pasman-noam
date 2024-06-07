import java.util.*;
class Bag{
  ArrayList<Character> chars;
  
  Bag(){
    chars = new ArrayList<Character>(7);
    chars.add('t');
    chars.add('i');
    chars.add('o');
    chars.add('j');
    chars.add('l');
    chars.add('s');
    chars.add('z');
  }
  
  char removeRandom(){
    int size = chars.size();
    //print(chars);
    return chars.remove((int)(random(size)));
  }
  
  boolean bagEmpty(){
    return chars.size() == 0;
  }
  
}
