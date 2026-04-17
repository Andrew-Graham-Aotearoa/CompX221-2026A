ArrayList<LottoLine> LottoList = new ArrayList<LottoLine>();



void setup()
{
  size(100, 100);

  String[] numList = loadStrings("lotto.csv");

  String[] numbers;

  for (String line : numList)
  {
    numbers = split(line, ',');

    int one = Integer.parseInt(numbers[0]);
    int two = Integer.parseInt(numbers[1]);
    int three = Integer.parseInt(numbers[2]);
    int four = Integer.parseInt(numbers[3]);
    int five = Integer.parseInt(numbers[4]);
    int six = Integer.parseInt(numbers[5]);

    if (numbers.length == 7)
    {
      int seven = Integer.parseInt(numbers[6]);

      LottoList.add
        (new PowerballLine(one, two, three, four, five, six, seven));
    } else if (numbers.length == 6)
    {
      LottoList.add(new LottoLine(one, two, three, four, five, six));
    } else
    {
      println("there is an error at " + line);
    }
  }
  for (LottoLine l : LottoList)
  {
    println(l);
  }
}

void draw() {
  background(200);
}
