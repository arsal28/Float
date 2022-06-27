class HighScore {
  
  HighScore() {}
  
  public int read() {
    BufferedReader reader;
    String line;
    
    reader = createReader("score.txt");
    
    try {
      line = reader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    
    return Integer.parseInt(line);
  }
  
  public void write(int score) {
    PrintWriter output;
    output = createWriter("score.txt");
    
    output.println(score);
    output.flush();
    output.close();
  }
  
  
}
