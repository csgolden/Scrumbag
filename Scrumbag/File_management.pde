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
      opgaver.setInt("prioritet", prioritet[i]);
      opgaver.setInt("status", status[i]);
      opgaver.setString("antal timer", antalTimer[i]);
      opgaver.setString("ansvarlig", ansvarlig[i]);
      Todo.setJSONObject(i, opgaver);
    }
    saveJSONObject(Save, selection.getAbsolutePath()+".json");
    //createOutput(selection.getAbsolutePath()+".json");
  }
}

void save() {
  //hvis man prøver at gemme mens der ikke er en fil åben så bare gå ud af funktionen
  if (currentlyOpen.equals(" ")) {
    return;
  }

  JSONObject Save = loadJSONObject(currentlyOpen);
  JSONArray Todo = Save.getJSONArray("Todo");
  Save = Save.setJSONArray("Todo", Todo);
  Save.setString("startdato", startdato);
  Save.setString("slutdato", slutdato);
  if (opgaveNavn.length>0) {
    startdato = startDato[0];
    slutdato = slutDato[slutDato.length-1];
  }

  try {
    for (int i = 0; i < opgaveNavn.length; i++) {
      JSONObject opgaver = new JSONObject();
      //opgaver.setInt("id", i);

      opgaver.setString("opgaven", opgaveNavn[i]);
      opgaver.setString("startdato", startDato[i]);
      opgaver.setString("slutdato", slutDato[i]);
      opgaver.setInt("prioritet", prioritet[i]);
      opgaver.setInt("status", status[i]);
      opgaver.setString("antal timer", antalTimer[i]);
      opgaver.setString("ansvarlig", ansvarlig[i]);

      Todo.setJSONObject(i, opgaver);
    }
  }
  catch (ArrayIndexOutOfBoundsException e) {
  }
  saveJSONObject(Save, currentlyOpen);
  //println(Save);
}

void fileOpen(File selection) {
  save();
  //tilføj automatisk gem af gammelt dokument? bare void save()?
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    opgaveNavn = new String[0];
    ansvarlig = new String[0];
    startDato = new String[0];
    slutDato = new String[0];
    prioritet = new int[0];
    status = new int[0];
    antalTimer = new String[0];
    projektnavn = selection.getName();
    JSONObject Save = loadJSONObject(selection.getAbsolutePath());
    JSONArray Todo = Save.getJSONArray("Todo");
    currentlyOpen = selection.getAbsolutePath();

    for (int i = 0; i < Todo.size(); i++) {

      JSONObject opgaver = Todo.getJSONObject(i);
      opgaveNavn = append(opgaveNavn, opgaver.getString("opgaven"));
      startDato = append(startDato, opgaver.getString("startdato"));
      slutDato = append(slutDato, opgaver.getString("slutdato"));
      ansvarlig = append(ansvarlig, opgaver.getString("ansvarlig"));
      prioritet = append(prioritet, opgaver.getInt("prioritet"));
      status = append(status, opgaver.getInt("status"));
      antalTimer = append(antalTimer, opgaver.getString("antalTimer"));
    }

    if (opgaveNavn.length!=0) {
      startdato = startDato[0];
      slutdato = slutDato[slutDato.length-1];
    }
    //printArray(opgaveNavn);
    //printArray(startDato);
    //printArray(slutDato);
  }
  state = 1;
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
    antalTimer = new String[0];
    JSONObject Save = new JSONObject();
    JSONArray Todo = new JSONArray();
    Save = Save.setJSONArray("Todo", Todo);
    currentlyOpen = selection.getAbsolutePath()+".json";
    if (opgaveNavn.length>0) {
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

    saveJSONObject(Save, selection.getAbsolutePath()+".json");
    //createOutput(selection.getAbsolutePath()+".json");

    //println(Save);
  
  nyOpgave(1);
  state = 1;
  }
}

void nyOpgave(int index) {
  //for nu er tanken at man kan tilføje opgaver specifikke steder. men ellers er det bare at skifte til append.

  opgaveNavn = splice(opgaveNavn, "", index-1);
  startDato = splice(startDato, "", index-1);
  slutDato = splice(slutDato, "", index-1);
  ansvarlig = splice(ansvarlig, "", index-1);
  prioritet = splice(prioritet, 0, index-1);
  antalTimer = splice(antalTimer, "", index-1);
  status = splice(status, 0, index-1);
}

void sletOpgave(int index) {
  if (opgaveNavn.length==1) {
    opgaveNavn = new String[0];
    ansvarlig = new String[0];
    startDato = new String[0];
    slutDato = new String[0];
    prioritet = new int[0];
    status = new int[0];
    antalTimer = new String[0];
  } else if (opgaveNavn.length==2) {
    if (index == 0) {
      index = 1;
    } else {
      index = 0;
    }
    opgaveNavn = new String[]{opgaveNavn[index]};
    ansvarlig = new String[]{ansvarlig[index]};
    startDato = new String[]{startDato[index]};
    slutDato = new String[]{slutDato[index]};
    prioritet = new int[]{prioritet[index]};
    status = new int[]{status[index]};
    antalTimer = new String[]{antalTimer[index]};
  } else if (opgaveNavn.length>2) {
    if (opgaveNavn.length==index+1) {
      opgaveNavn = subset(opgaveNavn, 0, opgaveNavn.length-1);
      startDato = subset(startDato, 0, startDato.length-1);
      slutDato = subset(slutDato, 0, slutDato.length-1);
      ansvarlig = subset(ansvarlig, 0, ansvarlig.length-1);
      prioritet = subset(prioritet, 0, prioritet.length-1);
      antalTimer = subset(antalTimer, 0, antalTimer.length-1);
      status = subset(status, 0, status.length-1);
    } else if (index == 0) {
      opgaveNavn = subset(opgaveNavn, 1, opgaveNavn.length-1);
      startDato = subset(startDato, 1, startDato.length-1);
      slutDato = subset(slutDato, 1, slutDato.length-1);
      ansvarlig = subset(ansvarlig, 1, ansvarlig.length-1);
      prioritet = subset(prioritet, 1, prioritet.length-1);
      antalTimer = subset(antalTimer, 1, antalTimer.length-1);
      status = subset(status, 1, status.length-1);
    } else {
      opgaveNavn = concat(subset(opgaveNavn, 0, index), subset(opgaveNavn, index+1, opgaveNavn.length-(index+1)));
      startDato = concat(subset(startDato, 0, index), subset(startDato, index+1, startDato.length-(index+1)));
      slutDato = concat(subset(slutDato, 0, index), subset(slutDato, index+1, slutDato.length-(index+1)));
      ansvarlig = concat(subset(ansvarlig, 0, index), subset(ansvarlig, index+1, ansvarlig.length-(index+1)));
      prioritet = concat(subset(prioritet, 0, index), subset(prioritet, index+1, prioritet.length-(index+1)));
      antalTimer = concat(subset(antalTimer, 0, index), subset(antalTimer, index+1, antalTimer.length-(index+1)));
      status = concat(subset(status, 0, index), subset(status, index+1, status.length-(index+1)));
    }
  }

}
