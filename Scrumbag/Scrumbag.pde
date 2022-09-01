import controlP5.*;


void setup() {
  size(1280, 720);
  fill(255, 52, 242);

  ControlP5 cp5;
  cp5 = new ControlP5(this);
  ButtonBar b = cp5.addButtonBar("bar")
    .setPosition(width/2.75, height/1.5)
    .setSize(400, 20)
    .addItems(split("New Load Sluk", " "))
    ;
}
void draw() {
  background(#3F3798);
   fill(255,52,246);
  textSize(256);
  text("Scrumbag", width/19, height/2);
}
