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
final String ADMIN_NAME = "Preeta";
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

  //check and load staff
  loadTimeSlotsForStaff(table.getRow(0).getString("Staff"));

  loginScreen = new LoginScreen(cp5, PASSWORD, timeSlots.get(0).getStaffName(), timeSlots);
  loginScreen.hide();

  homeScreen = new HomeScreen(timeSlots, timeSlots.get(0).getStaffName(), OFFICE);
  scheduleScreen = new ScheduleScreen(timeSlots, timeSlots.get(0).getStaffName(), OFFICE);
  currentScreen = homeScreen;
  
}


void draw()
{
  background(200);

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
      } else
      {
        role = "staff";
      }
      loadTimeSlotsForStaff(loginScreen.getEnteredUsername());
      staff = new Staff(enteredUserName, role, OFFICE);
      loginScreen.hide();
      _loginActive = false;
      homeScreen.resetShowLogin();
      currentScreen = scheduleScreen;
    
    }
    if (loginScreen.getIsCancelled() == true)
    {
      loginScreen.hide();
      _loginActive = false;
      homeScreen.resetShowLogin();
      currentScreen = homeScreen;
    }
  }
  if (currentScreen == homeScreen && homeScreen.getShowLogin())
  {
    _loginActive = true;
    loginScreen.show();
    loginScreen.loginReset();
    homeScreen.resetShowLogin();
  }
  
  if (currentScreen == homeScreen && homeScreen.getShowBooking())
{
    bookingScreen = new BookingScreen(cp5, homeScreen.getSelectedSlot(), timeSlots.get(0).getStaffName(), OFFICE);
    homeScreen.resetShowBooking();
    currentScreen = bookingScreen;
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

void loadTimeSlotsForStaff(String staffName)
{
  timeSlots.clear();
  for (TableRow row : table.rows())
  {
    if (row.getString("Staff").equals(staffName))
    {
      timeSlots.add(new TimeSlot(row, table));
    }
  }
}
