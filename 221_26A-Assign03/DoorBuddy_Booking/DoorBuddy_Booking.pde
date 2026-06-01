//import library
import controlP5.*;
ControlP5 cp5;

final String PASSWORD = "password123";
//Loads CSV
final String DEFAULT_STAFF = "2026_Assign3_Sample_Data_1.csv";


AbstractScreen currentScreen;
LoginScreen loginScreen;
ScheduleScreen scheduleScreen;
HomeScreen homeScreen;
BookingScreen bookingScreen;
Staff  staff;
final String ADMIN_NAME = "Phil";
final String OFFICE = "G23";

Table table;
ArrayList<TimeSlot> timeSlots;

//pretest for Set Schedule and login method
Boolean _loginActive = false;

void setup()
{
  size(1280, 720);

  cp5 = new ControlP5(this);

  table = loadTable(DEFAULT_STAFF, "header");
  timeSlots = new ArrayList<TimeSlot>();
  for (TableRow row : table.rows())
  {
    timeSlots.add(new TimeSlot(row, table));
  }

  loginScreen = new LoginScreen(cp5, PASSWORD, timeSlots.get(0).getStaffName(), timeSlots);
  loginScreen.hide();

  homeScreen = new HomeScreen(timeSlots, timeSlots.get(0).getStaffName(), OFFICE);
  scheduleScreen = new ScheduleScreen( timeSlots.get(0).getStaffName(), OFFICE);
  currentScreen = homeScreen;
}


void draw()
{
  currentScreen.draw();
  
  
  
  if (_loginActive == true)
  {
    loginScreen.draw();

    if (loginScreen.getIsAuthenticated() == true)
   
    {
      String role;
      String enteredUserName = loginScreen.getEnteredUsername();
      
      if (loginScreen.getEnteredUsername().equals(ADMIN_NAME))
      {
       role = "admin";
      }
      else
      {
        role = "staff";
      }
      staff = new Staff(enteredUserName, role, OFFICE);
      loginScreen.hide();
      _loginActive = false;
      currentScreen = scheduleScreen;
    }
    if (loginScreen.getIsCancelled() == true)
    {
      loginScreen.hide();
      _loginActive = false;
      currentScreen = homeScreen;
    }
  }
   println("Mouse position: " + mouseX + ", " + mouseY);
}

void mousePressed()
{
  if (_loginActive == true)
  {
    loginScreen.mousePressed(mouseX, mouseY);
  } else
    currentScreen.mousePressed(mouseX, mouseY);
}
