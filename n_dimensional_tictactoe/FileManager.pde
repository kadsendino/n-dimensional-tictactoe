class FileManager
{
  FileManager()
  {}
  
  ArrayList<String> readFile(String directory)
  {
    ArrayList <String> content = new ArrayList <String>();
    
    BufferedReader reader = createReader(directory);
   
    String line = null;
    try
    {
      while ((line = reader.readLine()) != null)
      { content.add(line); }
    }
    catch (IOException e)
    { e.printStackTrace(); }
    
    return content;
  }
  
  void saveFile(String[] content, String directory)
  { saveStrings(directory, content); }
}
