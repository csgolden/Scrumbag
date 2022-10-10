void Agile() {
  b.hide();
  edit.show();
  background(#FFFFFF);
  rectMode(CORNER);
  opgaverAgile();

  fill(#D9D9D9);

  rect(929, 81, 24, 643);

  fill(#A9A9A9);
  rect(953, 22, 123, 81);
  rect(1076, 22, 204, 51);
  rect(1076, 73, 68, 30);
  rect(1144, 73, 68, 30);
  rect(1212, 73, 68, 30);

  fill(#FFFFFF);
  int ansvarligTotal = 0;
  int diffTotal = 0;
  int brugtTotal = 0;
  int sum = 0;
  for (int i = 0; i<holdet.length; i++) {
    rect(953, 103+i*27, 123.37, 27);
    rect(1076, 103+i*27, 68, 27);
    rect(1144, 103+i*27, 68, 27);
    rect(1212, 103+i*27, 68, 27);

    for (int x = 0; x<opgaveNavn.length; x++) {
      //println(antalTimer[i], " ", ansvarlig[x], " ", holdet[i]);
      if (ansvarlig[x].equals(holdet[i])) {
        try {
          sum+=Integer.valueOf(antalTimer[x]);
          diffTotal += sum;
        }
        catch(Exception e) {
        }
      }
    }
    textAlign(CENTER, CENTER);
    fill(0);

    text(timerBrugt[i], 1144+(68/2), 103+i*27+(27/2)-1);

    if (!timerBrugt[i].equals("")) {
      int brugt = Integer.valueOf(timerBrugt[i]);
      brugtTotal += brugt;
      text(sum-brugt, 1212+(68/2), 103+i*27+(27/2)-1);
    }
    text(sum, 1076+(68/2), 103+i*27+(27/2));
    ansvarligTotal += sum;
    sum = 0;



    textAlign(LEFT, CENTER);
    text(holdet[i], 953+10, 103+i*27+(27/2)-1);




    fill(255);
  }
  int i = holdet.length;
  fill(#D1D1D1);
  rect(953, 103+i*27, 123.37, 27);
  rect(1076, 103+i*27, 68, 27);
  rect(1144, 103+i*27, 68, 27);
  rect(1212, 103+i*27, 68, 27);
  fill(0);
  textAlign(CENTER, CENTER);
  text(sum-diffTotal, 1212+(68/2), 103+i*27+(27/2)-1);
  text(brugtTotal, 1144+(68/2), 103+i*27+(27/2)-1);
  text(ansvarligTotal, 1110, 103+i*27+(27/2)-1);

  textAlign(LEFT, CENTER);
  text("Sum", 953+10, 103+i*27+(27/2)-1);
  agileScroll.draw();
  if (state==2) {
    BChart.BurnUP();
    myChart.show();
  } else {
    myChart.hide();
  }
  fill(#A9A9A9);
  rect(953, 400, 327, 320);
  strokeWeight(2);
  line(384, start+1-agileScroll.Scroll, 384, start+33*opgaveNavn.length-1-agileScroll.Scroll);
  line(490.5, start+1-agileScroll.Scroll, 490.5, start+33*opgaveNavn.length-1-agileScroll.Scroll);
  line(594.5, start+1-agileScroll.Scroll, 594.5, start+33*opgaveNavn.length-1-agileScroll.Scroll);
  line(701, start+1-agileScroll.Scroll, 701, start+33*opgaveNavn.length-1-agileScroll.Scroll);
  line(820, start+1-agileScroll.Scroll, 820, start+33*opgaveNavn.length-1-agileScroll.Scroll);
  fill(#D9D9D9);
  strokeWeight(1);

  //Scrumbag
  rect(-1, 0, 493, 48);
  //opgaveNavn
  rect(-1, 47, 386, 34);
  //prioritet
  rect(384, 47, 107, 34);
  //antal timer
  rect(490, 0, 105, 81);
  //ansvarlig
  rect(594, 0, 108, 81);
  //Status
  rect(701, 47, 120, 34);
  //Slutdato
  rect(820, 47, 133, 34);
  //startdato
  rect(701, 0, 120, 48);
  //slutdato
  rect(820, 0, 133, 48);
  textAlign(LEFT, LEFT);
  fill(0);

  //titel
  textAlign(LEFT, CENTER);
  textSize(26);
  text("Scrumbag", 10, 20);

  //Antal timer
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Antal timer", 542.5, 41.5);
  //\n
  //Ansvarlig
  text("Ansvarlig", 646.5, 41.5);

  //startdato
  textAlign(LEFT, TOP);
  textLeading(textDescent()+10);
  text("Startdato\n"+startdato, 707, 3);
  text("Slutdato\n"+slutdato, 826, 3);

  textSize(14);
  textAlign(LEFT, CENTER);
  text("Opgave navn", 5, 48+13.5);
  text("Prioritet", 389, 48+13.5);
  text("Status", 710, 48+13.5);
  text("Slutdato", 828, 48+13.5);




  //Antal timer (maks 1 uge)
  textSize(10);
  textAlign(CENTER, CENTER);
  text("(maks 1 uge)", 542.5, 58.5);

  //tidtabel
  textSize(16);
  text("Elev", 1014.5, 62.5);
  text("Timer", 1177.5, 45.5);
  //1110
  textSize(14);
  text("Ansvarlig", 1110, 87.5);
  text("Brugt", 1178, 87.5);
  text("Difference", 1245, 87.5);


  if (dropDown) {
    strokeWeight(1);

    if (hklik) {
      if(mouseX>953){
      dropdown(dropdownx, dropdowny, new String[]{"Fjern Medlem", "Nyt medlem"});
    } else{
      dropdown(dropdownx, dropdowny, new String[]{"Slet opgave", "Ny opgave over", "Ny opgave under"});
    }
    } else if (selected.x==6) {
      dropdown(dropdownx, dropdowny-int(agileScroll.Scroll), new String[]{"Lav", "Mellem", "Høj"});
    } else if (selected.x==1) {
      dropdown(dropdownx, dropdowny-int(agileScroll.Scroll), holdet);
    } 
  }
}
