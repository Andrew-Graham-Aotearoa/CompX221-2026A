//new Array List
ArrayList<String> wordList = new ArrayList<String>();

//index variable
int index = 0;

//new Pfont setup method
PFont font;
int size = 24;

void setup() {
  size(800, 800);
  
  smooth();
  font = createFont("ArialMT-16.vlw", size);
  textAlign(CENTER);
  frameRate(8);

  String[] lineArray = loadStrings("sourceText.txt");

  //string Array Variable setup and method
  String[] wordArray;

  //for each to loop through lineArray
  for (String line : lineArray)
  {
    wordArray = split(line, ' ');

    //Add each word to WordList
    for (String word : wordArray)
    {
      wordList.add(new String(word));
    }
  }

  //view the words in wordlist (word per line)
  for (String wordline : wordList )
  {
    println(wordline);
  }

  //using: for loop to iterate and print line
  //for (int i = 0; i < lineArray.length; i++)
  //{
  //  println(lineArray[i]);
  //}

  //using: for each loop to iterate and print line
  //for (String line : lineArray )
  //{
  //  println(line);
  //}
}

void draw()
{
  background(200);
  fill(#A61DDE);
  textFont(font, size);


  if (index < wordList.size())
  {
    text(wordList.get(index), mouseX, mouseY-50);
    index++;
  } else
  {
    index = 0;
  }
}
