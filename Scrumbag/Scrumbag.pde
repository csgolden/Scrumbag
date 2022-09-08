import controlP5.*;

//https://processing.org/reference/JSONArray.html
String[] opgaveNavn = {"test", " "};
String[] ansvarlig = {" "};
String[] startDato = {" "};
String[] slutDato = {" "};
int[] prioritet = {0};
int[] status = {0};
String[] antalTimer = {"0"};

String[][] coolioso = {opgaveNavn, ansvarlig, startDato, slutDato, antalTimer};
String projektnavn = "et eller andet";
String startdato;
String slutdato;
String currentlyOpen = " ";
PVector selected = new PVector(0, 0);

void setup() {
  size(1280, 720);
  fill(255,   52, 242);
  
  for(int i = 0; i<50; i++){
    nyOpgave(opgaveNavn.length);
  }
  

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
  coolioso = new String[][]{opgaveNavn, ansvarlig, startDato, slutDato, antalTimer};
  text("Scrumbag", width/19, height/2);
  
  textSize(12);
  try{
  for(int i = 0; i<opgaveNavn.length;i++){
  
  text(coolioso[0][i], width/2, height/2+20+i*20);
  }
  } catch (ArrayIndexOutOfBoundsException e){
  }
  /*
  println(" ", selected.x, "awd", selected.y, opgaveNavn.length);
  */
  //println(selected.y);
  printArray(opgaveNavn);
  
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

/*
void keyPressed(){
  if(key==ENTER&&int(selected.y+1.0)<opgaveNavn.length){
    selected = new PVector(selected.x, selected.y+1.0);
  }
  if(key=='$'&&int(selected.y)>0){
    selected = new PVector(selected.x, selected.y-1.0);
  }

  try {  
  if ((key >= '!' && key <= 'z'|| key == ' '||key >= 128 && key <= 255)&&key!='$'  ) {  // 12865
    
    coolioso[int(selected.x)][int(selected.y)] = coolioso[int(selected.x)][int(selected.y)] + key;
    // lånt kode slutter 
  } else if (key==BACKSPACE) {  //   opsummering: delete key
    
    // .substring kopiere tekstfelt, og fjern karaktere fra begyndelse og/eller slutningen
    // .length returnere mængden af karaktere i dets string som int. vi minuser med 1, for at slette et tegn
      coolioso[int(selected.x)][int(selected.y)] = coolioso[int(selected.x)][int(selected.y)].substring(0, coolioso[int(selected.x)][int(selected.y)].length()-1);
    
    
  }
  } 
  catch(StringIndexOutOfBoundsException e) {  // hvis det ville give den error message out of bounds
      coolioso[int(selected.x)][int(selected.y)] = "";
    }
  }
  
  */

  
