ArrayList<Item> ItemList = new ArrayList<Item>();



void setup()
{
  size(100, 100);

  //all files load as strings, therefore need to be cast to the correct type
  String[] items = loadStrings("Items.csv");
  String[] list;

  for (String line : items)
  {
    list = split(line, ',');

    //create list of items
    String item1;
    String item2;
    int item3;
    float item4;
    int item5;
    int item6;



    if (list.length == 5)
    {
      item1 = list[0];
      item2 = list[1];
      item3 = Integer.parseInt(list[2]);
      item4 = Float.parseFloat(list[3]);
      item5 = Integer.parseInt(list[4]);

      //add weapon object to the list
      ItemList.add( new Weapon(item1, item2, item3, item4, item5));
    } else if (list.length == 4)
    {
      //need to change the float to an int for this constructor
      
      item1 = list[0];
      item2 = list[1];
      item3 = Integer.parseInt(list[2]);
      item6 = Integer.parseInt(list[3]);
     
      ItemList.add( new Armour(item1, item2, item3, item6 ));
    } else
    {
      println("There is an error at" + line);
    }
  }
  //display the list to the console
  for (Item i : ItemList)
  {
    println(i);
  }
}

void draw()
{
}
