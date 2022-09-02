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
    println(Save);
  }
}

void save() {
  //ill fuck around and find out, men bare savetodesktop uden gemsom
}

void fileOpen(File selection) {
  //tilføj automatisk gem af gammelt dokument? bare void save()?
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    opgaveNavn = new String[0];
    startDato = new String[0];
    slutDato = new String[0];
    projektnavn = selection.getName();
    JSONObject Save = loadJSONObject(selection.getAbsolutePath());
    JSONArray Todo = Save.getJSONArray("Todo");

    for (int i = 0; i < Todo.size(); i++) {

      JSONObject opgaver = Todo.getJSONObject(i);
      opgaveNavn = append(opgaveNavn, opgaver.getString("opgaven"));
      startDato = append(startDato, opgaver.getString("startdato"));
      startDato = append(startDato, opgaver.getString("slutdato"));
    }
    printArray(opgaveNavn);
    printArray(startDato);
    printArray(slutDato);
  }
}
