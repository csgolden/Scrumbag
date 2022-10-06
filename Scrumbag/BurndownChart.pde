ControlP5 cp5;

class BurnUp {
  int timerTotal=60;
  int opgaver=10;

  float[]IT=new float[opgaver];
  float[] TTT= new float[opgaver];
  float[] TT= new float[opgaver];
  BurnUp() {
  }
  void resize() {
    int ChartWidth=myChart.getWidth(), ChartHeight=myChart.getHeight(), 
      ChartPosX=int(myChart.getPosition()[0]), ChartPosY=int(myChart.getPosition()[1]);

    if (mouseY<myChart.getHeight()+20+myChart.getPosition()[1]) {

      if (mouseY>myChart.getHeight()-20+myChart.getPosition()[1]) {
        if (mouseX<myChart.getWidth()+myChart.getPosition()[0]) {
          if (mouseX>myChart.getPosition()[0]) {

            myChart.setSize(ChartWidth, mouseY-int(myChart.getPosition()[1]));
          }
        }
      }
    }
    if (mouseY<int(myChart.getPosition()[1])+20) {
      if (mouseY>int(myChart.getPosition()[1])-20) {
        if (mouseX<myChart.getWidth()+myChart.getPosition()[0]) {
          if (mouseX>myChart.getPosition()[0]) {


            myChart.setPosition(ChartPosX, mouseY);
            myChart.setHeight(ChartHeight+(pmouseY-mouseY));
      
          }
        }
      }
    }
    if (mouseX<myChart.getWidth()+20+myChart.getPosition()[0]) {
      if (mouseX>myChart.getWidth()-20+myChart.getPosition()[0]) {
        if(mouseY<myChart.getHeight()+myChart.getPosition()[1]){
          if(mouseY>myChart.getPosition()[1]){
        myChart.setWidth(mouseX-ChartPosX);
      }}
    }}
    if (mouseX<int(myChart.getPosition()[0])+20) {    
      if (mouseX>int(myChart.getPosition()[0])-20) {
        if(mouseY<myChart.getHeight()+myChart.getPosition()[1]){
          if(mouseY>myChart.getPosition()[1]){
        myChart.setPosition(mouseX, ChartPosY);    
        myChart.setWidth(ChartWidth+(pmouseX-mouseX));      //int localheight=myChart.getHeight();      //myChart.setHeight(--);
      }
    }
  }}}
  void upData() {
    // TTT[0]=hvad end matematikken giver;
try{TT=expand(TT,int(daysPro));
for(int i=0; i<daysPro;i++){
  

}
    myChart.setData("TTT", TTT);
    myChart.setData("TT", TT);
    myChart.setData("IT", IT);


    myChart.setColors("IT", #1E10E8);
    myChart.setColors("TTT", #FC3700);
    myChart.setColors("TT", #FCCB00);
  }
catch(Exception e){
}
}
  void BurnUP() {

    IT[0]=0;
    IT[1]=1;
    IT[2]=2;
    IT[3]=3;
    IT[4]=4;
    IT[5]=5;
    IT[6]=6;
    IT[7]=7;
    IT[8]=8;
    IT[9]=9;

    TTT[0]=20;
    TTT[1]=30;
    TTT[2]=40;
    TTT[3]=50;
    TTT[4]=60;
    TTT[5]=60;
    TTT[6]=50;
    TTT[7]=40;
    TTT[8]=0;
    TTT[9]=60;

    TT[0]=18;
    TT[1]=28;
    TT[2]=38;
    TT[3]=0;
    TT[4]=58;
    TT[5]=8;
    TT[6]=48;
    TT[7]=38;
    TT[8]=2;
    TT[9]=58;
    myChart.addDataSet("IT");
    myChart.addDataSet("TTT");
    myChart.addDataSet("TT");
  }
  void prescence() {
    if (state==2) {
      myChart.show();
    } else {
      myChart.hide();
    }
  }
}
