

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
  }
  void mouseScroll() {
    Float r = (mouseY-y)/float(h);
    if(!(int(r*max)-10<=0)){
    Scroll = int(r*max)-10;
    }
    println(Scroll, " ", r);
  }
  
  
  void Scroll(int e) {

    if (Scroll+20>=max&&e>0) {
      return;
    }
    if (Scroll+e*3>=0) {
      Scroll += e*3;
    }
  }




  void draw() {
    
    if(mouseX>x&&mouseX<x+w&&mouseY>y&&mousePressed){
      this.mouseScroll();
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
    rect(x, r*h+y, w, 20);
  }
}
