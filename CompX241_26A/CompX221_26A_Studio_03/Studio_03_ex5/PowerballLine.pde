class PowerballLine extends LottoLine 
{
  private int _pow;
  
  public PowerballLine 
  (int num1, int num2, int num3, int num4, int num5, int num6, int pow)
  {
    super(num1, num2, num3, num4, num5, num6);
  _pow = pow;
  }
  
  public String toString()
  {
    return super.toString() + _pow;
  }
  
  
  
}
