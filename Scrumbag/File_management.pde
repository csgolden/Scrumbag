void setup() {
  selectOutput("Select a file to write to:", "saveToDesktop");
}

void saveToDesktop(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    createOutput(selection.getAbsolutePath());
  }
}

void save(File selection){
  
}

void fileOpen(File selection){
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    
  }
}




/*
// values = loadJSONArray("data.json");

  for (int i = 0; i < values.size(); i++) {
    
    JSONObject animal = values.getJSONObject(i); 

    int id = animal.getInt("id");
    String species = animal.getString("species");
    String name = animal.getString("name");

    println(id + ", " + species + ", " + name);
  }
  
  */
