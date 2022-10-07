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
