ControlP5 cp5;
void Forside() {

  ControlP5 cp5;
  cp5 = new ControlP5(this);
  ButtonBar b = cp5.addButtonBar("bar")
    .setPosition(0, 0)
    .setSize(400, 20)
    .addItems(split("a b c d e f g h i j", " "))
    ;
}

void Gant() {
}

void Agile() {
}
