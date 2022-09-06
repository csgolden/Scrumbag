//selectOutput("Select a file to write to:", "saveToDesktop");

void saveAs(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    JSONObject Save = new JSONObject();
    JSONArray Todo = new JSONArray();
    Save = Save.setJSONArray("Todo", Todo);
    projektnavn = selection.getName();
    Save.setString("projektnavn", selection.getName());
    Save.setString("startdato", startdato);
    Save.setString("slutdato", slutdato);
    if (opgaveNavn.length!=0) {
      startdato = startDato[0];
      slutdato = slutDato[slutDato.length-1];
    }


    for (int i = 0; i < opgaveNavn.length; i++) {
      JSONObject opgaver = new JSONObject();
      //opgaver.setInt("id", i);
      opgaver.setString("opgaven", opgaveNavn[i]);
      opgaver.setString("startdato", startDato[i]);
      opgaver.setString("slutdato", slutDato[i]);
      opgaver.setString("prioritet", slutDato[i]);
      opgaver.setInt("status", status[i]);
      opgaver.setInt("antal timer", antalTimer[i]);
      opgaver.setString("ansvarlig", ansvarlig[i]);
      Todo.setJSONObject(i, opgaver);
    }
    //println(Todo + " " + Todo.size());
    saveJSONObject(Save, selection.getAbsolutePath()+".json");
    //createOutput(selection.getAbsolutePath()+".json");
    println(selection.getAbsolutePath()+".json");
  }
}

void save() {
  //hvis man prøver at gemme mens der ikke er en fil åben så bare gå ud af funktionen
  if (currentlyOpen.equals(" ")) {
    return;
  }
  //ill fuck around and find out, men bare savetodesktop uden gemsom
  JSONObject Save = loadJSONObject(currentlyOpen);
  JSONArray Todo = Save.getJSONArray("Todo");
  Save = Save.setJSONArray("Todo", Todo);
  Save.setString("startdato", startdato);
  Save.setString("slutdato", slutdato);
  println("----- ", opgaveNavn.length, slutDato.length);
  if (opgaveNavn.length>0) {
    startdato = startDato[0];
    slutdato = slutDato[slutDato.length-1];
  }

  for (int i = 0; i < opgaveNavn.length; i++) {
    JSONObject opgaver = new JSONObject();
    //opgaver.setInt("id", i);
    opgaver.setString("opgaven", opgaveNavn[i]);
    opgaver.setString("startdato", startDato[i]);
    opgaver.setString("slutdato", slutDato[i]);
    opgaver.setString("prioritet", slutDato[i]);
    opgaver.setInt("status", status[i]);
    opgaver.setInt("antal timer", antalTimer[i]);
    opgaver.setString("ansvarlig", ansvarlig[i]);
    Todo.setJSONObject(i, opgaver);
  }

  //println(Todo + " " + Todo.size());
  saveJSONObject(Save, currentlyOpen);
  println(Save);
  
}

void fileOpen(File selection) {
  //tilføj automatisk gem af gammelt dokument? bare void save()?
  save();
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    opgaveNavn = new String[0];
    ansvarlig = new String[0];
    startDato = new String[0];
    slutDato = new String[0];
    prioritet = new int[0];
    status = new int[0];
    antalTimer = new int[0];
    projektnavn = selection.getName();
    JSONObject Save = loadJSONObject(selection.getAbsolutePath());
    JSONArray Todo = Save.getJSONArray("Todo");
    currentlyOpen = selection.getAbsolutePath();
    if (opgaveNavn.length!=0) {
      startdato = startDato[0];
      slutdato = slutDato[slutDato.length-1];
    }
    for (int i = 0; i < Todo.size(); i++) {

      JSONObject opgaver = Todo.getJSONObject(i);
      opgaveNavn = append(opgaveNavn, opgaver.getString("opgaven"));
      startDato = append(startDato, opgaver.getString("startdato"));
      slutDato = append(slutDato, opgaver.getString("slutdato"));
    }
    printArray(opgaveNavn);
    printArray(startDato);
    printArray(slutDato);
  }
}

void newFile(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    opgaveNavn = new String[0];
    ansvarlig = new String[0];
    startDato = new String[0];
    slutDato = new String[0];
    prioritet = new int[0];
    status = new int[0];
    antalTimer = new int[0];
    JSONObject Save = new JSONObject();
    JSONArray Todo = new JSONArray();
    Save = Save.setJSONArray("Todo", Todo);

    if (opgaveNavn.length!=0) {
      startdato = startDato[0];
      slutdato = slutDato[slutDato.length-1];
    } else {
      startdato = " ";
      slutdato = " ";
    }

    projektnavn = selection.getName();
    Save.setString("projektnavn", selection.getName());
    Save.setString("startdato", startdato);
    Save.setString("slutdato", slutdato);

    //println(Todo + " " + Todo.size());
    saveJSONObject(Save, selection.getAbsolutePath()+".json");
    //createOutput(selection.getAbsolutePath()+".json");
    println(selection.getAbsolutePath()+".json");
    println(Save);
  }
}

void nyOpgave(int index) {
  //for nu er tanken at man kan tilføje opgaver specifikke steder. men ellers er det bare at skifte til append.
  opgaveNavn = splice(opgaveNavn, "", index-1);
  startDato = splice(startDato, "", index-1);
  slutDato = splice(slutDato, "", index-1);
  ansvarlig = splice(ansvarlig, "", index-1);
  prioritet = splice(prioritet, 0, index-1);
  antalTimer = splice(antalTimer, 0, index-1);
  status = splice(status, 0, index-1);
}

void sletOpgave(int index){
//senere
}
