class Staff
{
  public String _staffName;
  public String _role;
  public String _office;
  public ArrayList<TimeSlot> _timeSlots;
 
 public Staff(String staffName, String role, String office)
 {
   _staffName = staffName;
   _role = role;
   _office = office;
 }
 
 public String getStaffName()
 {
   return _staffName;
 }
 
 public String getRole()
 {
  return _role; 
 }
 
 public String getOffice()
 {
  return _office; 
 }
 
 
}
