class Booking
{
 private String _userName;
 private String _email;
 private String _message;
 private String _bookingRef;
 
 public Booking(String userName, String email, String message, String bookingRef)
 {
 _userName = userName;
 _email = email;
 _message = message;
 _bookingRef = bookingRef;  
 }
  
  
 public String getUserName()
 {
  return _userName; 
 }
 
 public String getEmail()
 {
  return _email;
 }
 
 public String getMessage()
 {
  return _message; 
 }
 
 public void sendNotification()
 {
  println("Notification sent to: " + _userName + " at " + _email);
 }
  
  
 
}
