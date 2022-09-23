

class Scrollbar {
  int Scroll = 0;
  int x;
  int y;
  int w;
  int h;
  int max = opgaveNavn.length*33+300;
  Scrollbar(int xi, int yi, int wi, int hi) {
    x = xi;
    y = yi;
    w = wi;
    h = hi;

    println(h);
  }
  void mouseScroll() {
    Float r = (mouseY-start)/float(h);
    if(!(mouseY<start+20)){
    Scroll = int(r*max)-10;
    }
    println(Scroll, " ", r);
  }
  
  
  void Scroll(int e) {

    if (Scroll+20>=max&&e>0) {
      return;
    }
    if (Scroll+e*3>-3) {
      Scroll += e*3;
    }
  }




  void draw() {
    
    if(mouseX>width-20&&mouseY>start&&mousePressed){
      ganttScroll.mouseScroll();
    }
    
    max = (opgaveNavn.length*33+300);
    //scrolly
    if (h==0) {
      println("h");
    } else if (max==0) {
      println("max");
    }
    Float r;
    if (Scroll!=0) {
      r = float(Scroll)/float(max);
    } else {
      r = 0.0;
    }
    rect(x, r*h+start, w, 20);
  }
}
