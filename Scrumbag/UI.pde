
void Forside() {
  b.show();
  background(#3F3798);
  fill(255, 52, 246);
  textSize(256);
  text("Scrumbag", width/19, height/2);
}

void Gant() {
  b.hide();
  opgaver();
  strokeWeight(3);
  line(385, start+1-Scroll, 385, start+33*opgaveNavn.length-1-Scroll);
  line(491.5, start+1-Scroll, 491.5, start+33*opgaveNavn.length-1-Scroll);
  line(594.5, start+1-Scroll, 594.5, start+33*opgaveNavn.length-1-Scroll);
  line(1153, start+1-Scroll, 1153, start+33*opgaveNavn.length-1-Scroll);
  
  strokeWeight(0.5);
  fill(#D9D9D9);
  rect(width-20, start-1, 19, height-(start));
  rect(0, 0, width, start-1);
  strokeWeight(1);
  if(dropDown){
    strokeWeight(1);
    dropdown(dropdownx, dropdowny-Scroll, muligheder);
  }
  
}


void opgaver() {
  for (int i  = 0; i<opgaveNavn.length; i++) {

    fill(#D9D9D9);
    rect(0, 33*i-Scroll+start, width-20, 33);
    textSize(14);
    fill(0);
    textAlign(LEFT, CENTER);
    text(opgaveNavn[i], 9, 33*i-Scroll+start+15);
    if (status[i]==0) {
      text("Passiv", 1162, 33*i-Scroll+start+15);
    } else if (status[i]==1) {
      text("Aktiv", 1162, 33*i-Scroll+start+15);
    } else {
      text("Fuldført", 1162, 33*i-Scroll+start+15);
    }
    textAlign(CENTER, CENTER);
    text(startDato[i], 438.25, 33*i-Scroll+start+15);
    text(slutDato[i], 543, 33*i-Scroll+start+15);

    beginShape();
    vertex(1231, 10+33*i-Scroll+start+4);
    vertex(1247, 10+33*i-Scroll+start+4);
    vertex(1239.5, 10+33*i-Scroll+start+5+4);
    endShape(CLOSE);
  }
}

void dropdown(int clickx, int clicky, String[] a){
  for(int i = 0; i<a.length;i++){
    fill(#C1BFBF);
    rect(clickx+1, clicky+i*26-1, 105, 26);
    textAlign(LEFT, CENTER);
    textSize(14);
    fill(0);
    text(a[i], clickx+7, clicky+i*26-1+11);
  }
  
}
