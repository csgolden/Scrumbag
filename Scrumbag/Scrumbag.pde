import controlP5.*;

//https://processing.org/reference/JSONArray.html
String[] opgaveNavn = {"test"};
String[] ansvarlig = {" "};
String[] startDato = {" "};
String[] slutDato = {" "};
int[] prioritet = {0};
int[] status = {0};
int[] antalTimer = {0};
String projektnavn = "et eller andet";
// kan sættes automatisk bare ved at tage første element i startdato, og sidste element i slutdato
String startdato;
String slutdato;
String currentlyOpen = " ";

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
}
void draw() {
  background(#3F3798);
  fill(255, 52, 246);
  textSize(256);
  text("Scrumbag", width/19, height/2);
}

void bar(int n) {
  if (n==0) {
    selectOutput("Select a file to write to:", "newFile"); //ny fil
  } else if (n==1) {
    selectInput("Select a file: ", "fileOpen");   //åben et projekt done
  } else if (n==2) {
    exit();
  }
}
