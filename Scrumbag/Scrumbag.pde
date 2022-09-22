import controlP5.*;

//https://processing.org/reference/JSONArray.html
String[] opgaveNavn = {"test"};
String[] ansvarlig = {" "};
String[] startDato = {" "};
String[] slutDato = {" "};
int[] prioritet = {0};
int[] status = {0};
String[] antalTimer = {"0"};

String[][] coolioso = {opgaveNavn, ansvarlig, startDato, slutDato, antalTimer};
String projektnavn = "et eller andet";
String startdato = "";
String slutdato = "";
String currentlyOpen = " ";
PVector selected = new PVector(0, 0);

String[] muligheder = {"Passiv", "Aktiv", "Fuldført"};
Boolean dropDown = false;
Boolean hklik = false;
int dropdownx;
int dropdowny;

int state = 0;
Float Scroll = 0.0;
int start = 50;

ButtonBar b;
ButtonBar edit;

void setup() {
  size(1280, 720);
  fill(255, 52, 242);
vs1 = new VScrollbar(1270, 0, 20, height, 3*5+1);

  ControlP5 cp5;
  cp5 = new ControlP5(this);
  b = cp5.addButtonBar("bar")
    .setPosition(width/2.75, height/1.5)
    .setSize(400, 20)
    .addItems(split("New Load Sluk", " "))
    ;

  edit = cp5.addButtonBar("edit")
    .setPosition(width-(width-1100)-30, 0)
    .setSize((width-1090)+30, 20)
    .addItems(split("Gem som,Gem,Open,Forside,Gantt,Agile", ","))
    ;
  edit.hide();
  //selectOutput("Select a file to write to:", "saveAs");   //gem som done
  //save();  //gem ændringerne i det åbne projekt
}
void draw() {
  coolioso = new String[][]{opgaveNavn, ansvarlig, startDato, slutDato, antalTimer};
  strokeWeight(1);
println(state);
  if (state==0) {
    Forside();
  } else if (state==1) {
    Gant();
  } else {
    //Agile();
  }
  textSize(12);
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


void keyPressed() {

  Float[] lengths = {385.0, 0.0, 106.5, 106.5, 0.0, 0.0, 0.0, 0.0};
  if (selected.x>=5) {
    return;
  }
  //textsize skal sættes til 14 mens den checker textWidth
  textSize(14);
  try {
    if ((key >= '!' && key <= 'z'|| key == ' '||key >= 128 && key <= 255)&&key!='$'&&int(textWidth(coolioso[int(selected.x)][int(selected.y)]))+17<lengths[int(selected.x)]-10&&state==1) {  // 12865

      coolioso[int(selected.x)][int(selected.y)] = coolioso[int(selected.x)][int(selected.y)] + key;
      // lånt kode slutter
    } else if (key==BACKSPACE) {  //   opsummering: delete key

      // .substring kopiere tekstfelt, og fjern karaktere fra begyndelse og/eller slutningen
      // .length returnere mængden af karaktere i dets string som int. vi minuser med 1, for at slette et tegn
      coolioso[int(selected.x)][int(selected.y)] = coolioso[int(selected.x)][int(selected.y)].substring(0, coolioso[int(selected.x)][int(selected.y)].length()-1);
    }
  }
  catch(StringIndexOutOfBoundsException e) {  // hvis det ville give den error message out of bounds
  }
}

void mousePressed() {

  if (state==1) {
    for (int x = 0; x<muligheder.length; x++) {
      if (dropDown) {
        if (hklik) {
          if (mouseY>dropdowny+26*x&&mouseY<dropdowny+26+26*x&&mouseX>dropdownx&&mouseX<dropdownx+105) {
            hklik = false;
            if (x==0) {
              if(opgaveNavn.length!=1){
              sletOpgave(int(selected.y));
              } else{
                sletOpgave(int(selected.y));
                nyOpgave(1);
              }
            } else if (x==1) {
              nyOpgave(int(selected.y)+1);
            } else {
              nyOpgave(int(selected.y)+2);
            }


            dropDown = false;
            return;
          }
        } else if (mouseY>dropdowny-Scroll+26*x&&mouseY<dropdowny-Scroll+26+26*x&&mouseX>1155&&mouseX<width-20) {

          status[int(selected.y)] = x;
          dropDown = false;
          return;
        }
      }
    }
    hklik = false;
    for (int i  = 0; i<opgaveNavn.length; i++) {
      if (mouseButton == RIGHT&&mouseY>33*i-Scroll+start&&mouseY<33*i-Scroll+start+33) {
        hklik = true;
        dropDown = true;
        dropdownx = mouseX;
        dropdowny = mouseY;
        selected = new PVector(5, i);
        return;
      } else if (mouseY>33*i-Scroll+start&&mouseY<33*i-Scroll+start+33&&mouseX<385) {
        //klikkede på opgaveNavn
        selected = new PVector(0, i);
      } else if (mouseY>33*i-Scroll+start&&mouseY<33*i-Scroll+start+33&&mouseX<491.5&&mouseX>385) {
        //klikkede på startdato
        selected = new PVector(2, i);
      } else if (mouseY>33*i-Scroll+start&&mouseY<33*i-Scroll+start+33&&mouseX<594.5&&mouseX>491.5) {
        //klikkede på slutDato
        selected = new PVector(3, i);
      } else if (mouseY>33*i-Scroll+start&&mouseY<33*i-Scroll+start+33&&mouseX>1153&&mouseX<width-20) {
        //klikkede på status
        if (dropDown) {
          dropDown = false;
        } else {
          dropDown = true;
          dropdownx = 1153;
          dropdowny = 33*i+start+33;
          selected = new PVector(5, i);
        }
        return;
      }
    }
    dropDown = false;
  }
}

void mouseWheel(MouseEvent event) {
  dropDown = false;
  float e = event.getCount();
  if (Scroll+e*3>-3&&state==1) {
    
      Scroll += e*3;

  }
}
