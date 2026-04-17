class LottoLine
{
  protected int[] _LottoNum;

  public LottoLine
    (int num1, int num2, int num3, int num4, int num5, int num6)
  {
    _LottoNum = new int[6];
    _LottoNum[0]= num1;
    _LottoNum[1]= num2;
    _LottoNum[2]= num3;
    _LottoNum[3]= num4;
    _LottoNum[4]= num5;
    _LottoNum[5]= num6;
  }

  public String toString()
  {
    String result = "";
    
    for(int i = 0; i < _LottoNum.length; i++)
    {
     result = result + _LottoNum[i] + " ";
    }
    return result;
  }
}
