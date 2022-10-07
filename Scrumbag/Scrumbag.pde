import controlP5.*;
Scrollbar ganttScroll;
Scrollbar agileScroll;

//https://processing.org/reference/JSONArray.html
String[] opgaveNavn = {"test"};
String[] ansvarlig = {" "};
String[] startDato = {" "};
String[] slutDato = {" "};
String[] prioritet = {""};
int[] status = {0};
String[] antalTimer = {"0", " ", " "};
String[] timerBrugt = {"2", "0", "0"};
String[] holdet = {"Lukas", "Jacob", "etc"};

String[][] coolioso = {opgaveNavn, ansvarlig, startDato, slutDato, antalTimer, timerBrugt, prioritet, holdet};
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

BurnUp BChart = new BurnUp();
Chart myChart;
void setup() {
  size(1280, 720);
  fill(255, 52, 242);

  ganttScroll = new Scrollbar(width-20, start-1, 19, height-(start));
  agileScroll = new Scrollbar(929, 81, 24, height-81-20);




  ControlP5 cp5;
  cp5 = new ControlP5(this);
  b = cp5.addButtonBar("bar")
    .setPosition(width/2.75, height/1.5)
    .setSize(400, 20)
    .addItems(split("New Load Sluk", " "))
    ;

  edit = cp5.addButtonBar("edit")
    .setPosition(953, 0)
    .setSize(330, 24)
    .addItems(split("Gem som,Gem,Open,Forside,Gantt,Agile", ","))
    ;
  edit.hide();
  //selectOutput("Select a file to write to:", "saveAs");   //gem som done
  //save();  //gem ændringerne i det åbne projekt
myChart = cp5.addChart("") 
.setPosition(width-326, height-319)
    .setSize(326, 319)
    .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
    .setStrokeWeight(1.5)
    .setColorCaptionLabel(#03FC00)
    .setMoveable(true)
    .setRange(0, 60)
    .setColorBackground(#FFFFFF)
    .hide();
}
void draw() {
  //println("jeg er her - ", prioritet[0]);
  coolioso = new String[][]{opgaveNavn, ansvarlig, startDato, slutDato, antalTimer, timerBrugt, prioritet, holdet};
  strokeWeight(1);
  //println(state);
  if (state==0) {
    Forside();
  } else if (state==1) {
    Gant();
  } else {
    Agile();
  }
  textSize(12);

  BChart.prescence();
  if (state==2) {
    BChart.upData();
  }
}

void edit(int n) {
  if (n==0) {
    selectOutput("Select a file to write to:", "saveAs");
  } else if (n==1) {
    save();
  } else if (n==2) {
    selectInput("Select a file: ", "fileOpen");
  } else if (n==3) {
    state = 0;
  } else if (n==4) {
    start = 50;
    //hvis den selected er en umulig at skrive i eller ikke findes er det det samme som at unselect noget
    selected = new PVector(10, 0);
    state = 1;
  } else {
    start = 81;
    //hvis den selected er en umulig at skrive i eller ikke findes er det det samme som at unselect noget
    selected = new PVector(10, 0);
    state = 2;
  }
}

void bar(int n) {
  if (n==0) {
    selectOutput("Select a file to write to:", "newFile"); //ny fil
  } else if (n==1) {
    selectInput("Select a file: ", "fileOpen");   //åben et projekt done
    noLoop();
    state = 1;
  } else if (n==2) {
    exit();
  }
}


void keyPressed() {
  Float[] lengths = new Float[8];
  if (state == 1) {
    lengths = new Float[]{385.0, 0.0, 106.5, 106.5, 0.0, 0.0, 0.0,122.0};
  } else if (state == 2) {
    lengths = new Float[]{385.0, 0.0, 0.0, 109.0, 102.0, 0.0, 0.0, 122.0};
  }
  if (selected.x>coolioso.length) {
    return;
  }
  //textsize skal sættes til 14 mens den checker textWidth
  textSize(14);
  try {
    if ((key >= '!' && key <= 'z'|| key == ' '||key >= 128 && key <= 255)&&key!='$'&&int(textWidth(coolioso[int(selected.x)][int(selected.y)]))+17<lengths[int(selected.x)]-10) {  // 12865

      coolioso[int(selected.x)][int(selected.y)] = coolioso[int(selected.x)][int(selected.y)] + key;
      // lånt kode slutter
    } else if (key==BACKSPACE) {  //   opsummering: delete key

      // .substring kopiere tekstfelt, og fjern karaktere fra begyndelse og/eller slutningen
      // .length returnere mængden af karaktere i dets string som int. vi minuser med 1, for at slette et tegn
      coolioso[int(selected.x)][int(selected.y)] = coolioso[int(selected.x)][int(selected.y)].substring(0, coolioso[int(selected.x)][int(selected.y)].length()-1);
    }
  }
  catch(Exception e) {  // hvis det ville give den error message out of bounds
  }
}

void mousePressed() {
  if (state==1) {
    //width-20, start-1, 19



    for (int x = 0; x<muligheder.length; x++) {
      if (dropDown) {
        if (hklik) {
          if (mouseY>dropdowny+26*x&&mouseY<dropdowny+26+26*x&&mouseX>dropdownx&&mouseX<dropdownx+105) {
            hklik = false;
            if (x==0) {
              if (opgaveNavn.length!=1) {
                sletOpgave(int(selected.y));
              } else {
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
        } else if (mouseY>dropdowny-ganttScroll.Scroll+26*x&&mouseY<dropdowny-ganttScroll.Scroll+26+26*x&&mouseX>1155&&mouseX<width-20) {

          status[int(selected.y)] = x;
          dropDown = false;
          return;
        }
      }
    }
    hklik = false;
    for (int i  = 0; i<opgaveNavn.length; i++) {
      if (mouseButton == RIGHT&&mouseY>33*i-ganttScroll.Scroll+start&&mouseY<33*i-ganttScroll.Scroll+start+33) {
        hklik = true;
        dropDown = true;
        dropdownx = mouseX;
        dropdowny = mouseY;
        selected = new PVector(5, i);
        return;
      } else if (mouseY>33*i-ganttScroll.Scroll+start&&mouseY<33*i-ganttScroll.Scroll+start+33&&mouseX<385) {
        //klikkede på opgaveNavn
        selected = new PVector(0, i);
      } else if (mouseY>33*i-ganttScroll.Scroll+start&&mouseY<33*i-ganttScroll.Scroll+start+33&&mouseX<491.5&&mouseX>385) {
        //klikkede på startdato
        selected = new PVector(2, i);
      } else if (mouseY>33*i-ganttScroll.Scroll+start&&mouseY<33*i-ganttScroll.Scroll+start+33&&mouseX<594.5&&mouseX>491.5) {
        //klikkede på slutDato
        selected = new PVector(3, i);
      } else if (mouseY>33*i-ganttScroll.Scroll+start&&mouseY<33*i-ganttScroll.Scroll+start+33&&mouseX>1153&&mouseX<width-20) {
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

    //------------------------------------------------------------------------------------------------------------------
  } else if (state==2) {
    
    for (int i  = 0; i<holdet.length; i++) {
      if (mouseY>102+i*27&&mouseY<102+27+27*i&&mouseX>953) {
        println(i);
        //klikkede på tidstabel
        println("det virker");
        if (mouseButton==RIGHT) {
          if (dropDown) {
            dropDown = false;
          } else {
            hklik = true;
            dropDown = true;
            dropdownx = mouseX;
            dropdowny = mouseY;
            selected = new PVector(7, i);
          }
          return;
        }
        selected = new PVector(7, i);
      }
    }
    for (int x = 0; x<muligheder.length; x++) {
      if (dropDown) {
        if (hklik) {
          if (mouseY>dropdowny+26*x&&mouseY<dropdowny+26+26*x&&mouseX>dropdownx&&mouseX<dropdownx+105&&mouseX<953) {
            hklik = false;
            if (x==0) {
              if (opgaveNavn.length!=1) {
                sletOpgave(int(selected.y));
              } else {
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
          } else if (mouseY>dropdowny+27*x&&mouseY<dropdowny+27+27*x&&mouseX>dropdownx&&mouseX<dropdownx+105) {
            println(x);
            //do the things
            if (x==0) {
              if (holdet.length==2) {
                if (selected.y==0) {
                  holdet = subset(holdet, 1, 1);
                } else {
                  holdet = subset(holdet, 0, 1);
                }
              }
              if (holdet.length>=3) {
                if (selected.y==0) {
                  holdet = subset(holdet, 1);
                } else if (selected.y==holdet.length-1) {
                  holdet = subset(holdet, 0, holdet.length-1 );
                } else {
                  holdet = concat(subset(holdet, 0, int(selected.y)), subset(holdet, int(selected.y)+1, holdet.length-(int(selected.y)+1)));
                }
              }
            } else if (x==1) {
              holdet = append(holdet, "nyperson");
              timerBrugt = append(timerBrugt, "0");
            }

            dropDown = false;
            return;
          }
          //det her er meget hurtigt meget dumt men det virker så sagsøg mig
        } else if (mouseY>26*x-agileScroll.Scroll+start+33*(int(selected.y)+1)&&mouseY<26*(x+1)-agileScroll.Scroll+start+33*(int(selected.y)+1)) {

          if (int(selected.x)==6&&mouseX<490.5&&mouseX>385) {
            println(x, int(selected.y));
            if (x==0) {
              prioritet[int(selected.y)] = "Lav";
            } else if (x==1) {
              prioritet[int(selected.y)] = "Mellem";
            } else {
              prioritet[int(selected.y)] = "Høj";
            }
          } else if (int(selected.x)==1&&mouseX<702&&mouseX>594.5) {
            ansvarlig[int(selected.y)] = holdet[x];
          }
          dropDown = false;
          return;
        }
      }
    }


    hklik = false;
    for (int i  = 0; i<opgaveNavn.length; i++) {
      if (mouseButton == RIGHT) {
        if (mouseY>33*i-agileScroll.Scroll+start&&mouseY<33*i-agileScroll.Scroll+start+33&&mouseX<953) {
          hklik = true;
          dropDown = true;
          dropdownx = mouseX;
          dropdowny = mouseY;
          selected = new PVector(5, i);
          return;
        }
      } else if (mouseY>33*i-agileScroll.Scroll+start&&mouseY<33*i-agileScroll.Scroll+start+33&&mouseX<385) {
        //klikkede på opgaveNavn
        selected = new PVector(0, i);
      } else if (mouseY>33*i-agileScroll.Scroll+start&&mouseY<33*i-agileScroll.Scroll+start+33&&mouseX<490.5&&mouseX>385) {





        if (dropDown) {
          dropDown = false;
        } else {
          dropDown = true;
          dropdownx = 383;
          dropdowny = 33*(i+1)+start+1;
          selected = new PVector(6, i);
        }
        return;
      } else if (mouseY>33*i-agileScroll.Scroll+start&&mouseY<33*i-agileScroll.Scroll+start+33&&mouseX<594.5&&mouseX>490.5) {
        //klikkede på antaltimer
        selected = new PVector(4, i);
        //println(selected, " ", coolioso[int(selected.x)][int(selected.y)]);
      } else if (mouseY>33*i-agileScroll.Scroll+start&&mouseY<33*i-agileScroll.Scroll+start+33&&mouseX>594.5&&mouseX<701) {

        //DROPDOWN
        println("ansvarlig");
        muligheder = holdet;
        if (dropDown) {
          dropDown = false;
        } else {
          dropDown = true;
          dropdownx = 594;
          dropdowny = 33*(i+1)+start+1;
          selected = new PVector(1, i);
        }
        return;
      } else if (mouseY>33*i-agileScroll.Scroll+start&&mouseY<33*i-agileScroll.Scroll+start+33&&mouseX>822&&mouseX<930) {
        selected = new PVector(3, i);
      } else if (mouseY>33*i-ganttScroll.Scroll+start&&mouseY<33*i-ganttScroll.Scroll+start+33&&mouseX>1153&&mouseX<width-20) {
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
  }
  dropDown = false;
//opgaverGant();
}

void mouseWheel(MouseEvent event) {
  dropDown = false;
  int e = event.getCount();
  if (state==1) {
    ganttScroll.Scroll(e);
  } else if (state==2) {
    agileScroll.Scroll(e);
  }
}


void mouseDragged() {
 
 BChart.resize();
}
