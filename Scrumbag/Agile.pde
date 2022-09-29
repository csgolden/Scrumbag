void Agile() {
  b.hide();
  edit.show();
  background(#FFFFFF);
  rectMode(CORNER);
  fill(#D9D9D9);

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



  rect(929, 81, 24, 643);

  fill(#A9A9A9);
  rect(953, 22, 123, 81);
  rect(1076, 22, 204, 51);
  rect(1076, 73, 68, 30);
  rect(1144, 73, 68, 30);
  rect(1212, 73, 68, 30);

  fill(#FFFFFF);
  int sum = 0;
  for (int i = 0; i<holdet.length; i++) {
    rect(953, 103+i*27, 123.37, 27);
    rect(1076, 103+i*27, 68, 27);
    rect(1144, 103+i*27, 68, 27);
    rect(1212, 103+i*27, 68, 27);
    for (int x = 0; x<opgaveNavn.length; x++) {
      if (ansvarlig[x].equals(holdet[i])) {
        sum+=Integer.valueOf(antalTimer[i]);
      }
    }
    textAlign(CENTER, CENTER);
    fill(0);
    
    text(timerBrugt[i], 1144+(68/2), 103+i*27+(27/2)-1);
    if(!timerBrugt[i].equals("")){
      text(sum-Integer.valueOf(timerBrugt[i]), 1212+(68/2), 103+i*27+(27/2)-1);
    }
    text(sum, 1076+(68/2), 103+i*27+(27/2));
    textAlign(LEFT, CENTER);
    text(holdet[i], 953+10, 103+i*27+(27/2)-1);
    fill(255);
  }
  agileScroll.draw();
  if(state==2){BChart.BurnUP();myChart.show();}else{myChart.hide();}
  fill(#A9A9A9);
  rect(953, 400, 327, 320);
}
