class Weapon extends Item
{
  private float _attackSpeed;
  private int _damage;

  //swords, maces and ranged weapons

  public Weapon
    (String name, String type, int value,
    float attackSpeed, int damage)
  {
    super(name, type, value);
    _attackSpeed = attackSpeed;
    _damage = damage;
  }
  
   public String toString()
  {
   return super.toString() + " " + nf(_attackSpeed, 1, 2) +" "+ _damage;
  }
  
}
