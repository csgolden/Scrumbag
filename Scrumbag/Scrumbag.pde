import controlP5.*;

//https://processing.org/reference/JSONArray.html
String[] opgaveNavn = {"test2test", "skabelon"};
String[] ansvarlig = {"idk", "idk"};
String[] startDato = {"25.08.2022", "25.08.2022"};
String[] slutDato = {"25.08.2022", "25.08.2022"};
int[] prioritet = {0, 0};
int[] status = {0, 0};
int[] antalTimer = {0, 0};
String projektnavn;
// kan sættes automatisk bare ved at tage første element i startdato, og sidste element i slutdato
String startdato = startDato[0];
String slutdato = slutDato[slutDato.length-1];
String currentlyOpen = "/Users/lukasnadj/Documents/Scrumbag/Scrumbag/data/Untitled.json";

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
  //selectOutput("Select a file to write to:", "saveAs");   //gem som done
  //save();  //gem ændringerne i det åbne projekt
  //selectInput("Select a file: ", "fileOpen");   //åben et projekt done
}
void draw() {
  background(#3F3798);
   fill(255,52,246);
  textSize(256);
  text("Scrumbag", width/19, height/2);
}
