import java.util.Date;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

void Forside() {
  b.show();
  println(System.nanoTime());
  edit.hide();
  background(#3F3798);
  fill(255, 52, 246);
  textSize(256);
  text("Scrumbag", width/19, height/2);
}

void Gant() {
  b.hide();
  
  edit.show();
  background(#FAF9ED);
  opgaverGant();
  strokeWeight(3);
  line(385, start+1-ganttScroll.Scroll, 385, start+33*opgaveNavn.length-1-ganttScroll.Scroll);
  line(491.5, start+1-ganttScroll.Scroll, 491.5, start+33*opgaveNavn.length-1-ganttScroll.Scroll);
  line(594.5, start+1-ganttScroll.Scroll, 594.5, start+33*opgaveNavn.length-1-ganttScroll.Scroll);
  line(1153, start+1-ganttScroll.Scroll, 1153, start+33*opgaveNavn.length-1-ganttScroll.Scroll);

  strokeWeight(0.5);
  fill(#D9D9D9);
  rect(width-20, start-1, 19, height-(start));
  rect(0, 0, width, start-1);
  strokeWeight(1);
  fill(0);
  textSize(20);
  textAlign(LEFT, CENTER);
  if (projektnavn.length()>5&&projektnavn.substring(projektnavn.length()-5, projektnavn.length()).equals(".json")) {
    projektnavn = projektnavn.substring(0, projektnavn.length()-5);
  }
  text(projektnavn, 10, start-textAscent());
  textAlign(CENTER, CENTER);
  textSize(18);
  text("Tidslinje", 873.75, start-textAscent());
  if (startDato.length!=0) {
    if (startDato[0].equals("")) {
      text("Udefineret", 437.25, start-textAscent());
    } else {
      text(startDato[0], 437.25, start-textAscent());
    }


    if (slutDato[slutDato.length-1].equals("")) {
      text("Udefineret", 543.75, start-textAscent());
    } else {
      text(slutDato[slutDato.length-1], 543.75, start-textAscent());
    }
  }
  if (dropDown) {
    strokeWeight(1);
    if (hklik) {
      dropdown(dropdownx, dropdowny, new String[]{"Slet opgave", "Ny opgave over", "Ny opgave under"});
    } else {
      dropdown(dropdownx, dropdowny-int(ganttScroll.Scroll), new String[]{"Passiv", "Aktiv", "Fuldført"});
    }
  }
  textAlign(LEFT, LEFT);

  ganttScroll.draw();

  fill(255);
}









void opgaverGant() {
  for (int i  = 0; i<opgaveNavn.length; i++) {

    fill(#EDEDED);
    rect(0, 33*i-ganttScroll.Scroll+start, width-20, 33);
    textSize(14);
    fill(0);
    textAlign(LEFT, CENTER);
    text(opgaveNavn[i], 9, 33*i-ganttScroll.Scroll+start+15);



    if (status[i]==0) {
      text("Passiv", 1162, 33*i-ganttScroll.Scroll+start+15);
      fill(#959595);
    } else if (status[i]==1) {
      text("Aktiv", 1162, 33*i-ganttScroll.Scroll+start+15);
      fill(#F0F298);

      //rect(600, 7+33*i-ganttScroll.Scroll+start, 550, 18);
    } else {
      text("Fuldført", 1162, 33*i-ganttScroll.Scroll+start+15);
      fill(#1BA029);

      //rect(600+550*0.1, 7+33*i-ganttScroll.Scroll+start, 550*0.9, 18);
    }

    try {
      int[] begin = int(split(startDato[i], '/'));
      Date begynd = new Date(begin[2]-1900, begin[1]-1, begin[0]);

      int[] færdig = int(split(slutDato[i], '/'));
      Date slut = new Date(færdig[2]-1900, færdig[1]-1, færdig[0]);

      long begyndInMs = begynd.getTime();
      long slutInMs = slut.getTime();

      long len = 550*(begyndInMs/slutInMs);
      if(begyndInMs<slutInMs){
      rect(600, 7+33*i-ganttScroll.Scroll+start, len, 18);
      }
      println(begyndInMs);
      println(slutInMs);
    }
    catch(Exception e) {
    }


    beginShape();
    vertex(1231, 10+33*i-ganttScroll.Scroll+start+4);
    vertex(1247, 10+33*i-ganttScroll.Scroll+start+4);
    vertex(1239.5, 10+33*i-ganttScroll.Scroll+start+5+4);
    endShape(CLOSE);

    fill(0);
    textAlign(CENTER, CENTER);
    text(startDato[i], 438.25, 33*i-ganttScroll.Scroll+start+15);
    text(slutDato[i], 543, 33*i-ganttScroll.Scroll+start+15);
  }
}

void opgaverAgile() {
  for (int i  = 0; i<opgaveNavn.length; i++) {

    fill(#EDEDED);
    rect(0, 33*i-ganttScroll.Scroll+start, width-20, 33);
    textSize(14);
    fill(0);
    textAlign(LEFT, CENTER);
    text(opgaveNavn[i], 9, 33*i-ganttScroll.Scroll+start+15);
    if (status[i]==0) {
      text("Passiv", 1162, 33*i-ganttScroll.Scroll+start+15);
      fill(#D7E4F5);
    } else if (status[i]==1) {
      text("Aktiv", 1162, 33*i-ganttScroll.Scroll+start+15);
      fill(#F0F298);
    } else {
      text("Fuldført", 1162, 33*i-ganttScroll.Scroll+start+15);
      fill(#1BA029);
    }
    beginShape();
    vertex(1231, 10+33*i-ganttScroll.Scroll+start+4);
    vertex(1247, 10+33*i-ganttScroll.Scroll+start+4);
    vertex(1239.5, 10+33*i-ganttScroll.Scroll+start+5+4);
    endShape(CLOSE);

    fill(0);
    textAlign(CENTER, CENTER);
    text(startDato[i], 438.25, 33*i-ganttScroll.Scroll+start+15);
    text(slutDato[i], 543, 33*i-ganttScroll.Scroll+start+15);
  }
}

void dropdown(int clickx, int clicky, String[] a) {

  for (int i = 0; i<a.length; i++) {
    fill(#D8D6D6);
    textAlign(LEFT, CENTER);
    textSize(13);
    rect(clickx+1, clicky+i*26-1, 105, 26);
    fill(0);
    text(a[i], clickx+7, clicky+i*26-1+11);
  }
}
