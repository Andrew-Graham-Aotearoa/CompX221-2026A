class LoginScreen
{
  private ControlP5 _cp5;
  private String _currentStaffName;
  private String _password;
  private ArrayList<TimeSlot> _timeSlots;
  private Boolean _isAuthenticated;
  private Boolean _isCancelled;
  private Boolean _authFailed;
  private Boolean _goToSchedule;
  private Button _confirmButton;
  private Button _cancelButton;
  private Button _scheduleButton;
  private Table _table;


  public LoginScreen
    (ControlP5 cp5,
    String password,
    String currentStaffName,
    ArrayList<TimeSlot> timeSlots,
    Table table)
  {
    _table = table;
    _goToSchedule = false;

    _cp5 = cp5;
    _password = password;
    _currentStaffName = currentStaffName;
    _timeSlots = timeSlots;
    _isAuthenticated = false;
    _isCancelled = false;
    _authFailed = false;
    _confirmButton = new Button(640, 410, color(100, 200, 100), 120, 40, "CONFIRM");
    _scheduleButton = new Button(640, 460, color(200, 228, 251), 120, 40, "SCHEDULE");
    _cancelButton = new Button(640, 510, color(200, 100, 100), 120, 40, "CANCEL");

    _cp5.addTextfield("username")
      .setPosition(580, 280)
      .setSize(200, 40)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setColorForeground(color(0))
      .setColorActive(color(116, 195, 118))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText(_currentStaffName);

    _cp5.addTextfield("password")
      .setPosition(580, 330)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setColorForeground(color(0))
      .setColorActive(color(116, 195, 118))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setSize(200, 40);
  }

  public void show()
  {
    _cp5.getController("username").show();
    _cp5.getController("password").show();
  }

  public void hide()
  {
    _cp5.getController("username").hide();
    _cp5.getController("password").hide();
    _cp5.get(Textfield.class, "username").clear();
    _cp5.get(Textfield.class, "password").clear();
  }

  public void loginReset()
  {
    _isAuthenticated = false;
    _isCancelled = false;
    _authFailed = false;
    _goToSchedule = false;
  }

  public Boolean getIsAuthenticated()
  {
    return _isAuthenticated;
  }

  public Boolean getGoToSchedule()
  {
    return _goToSchedule;
  }


  public void authenticate()
  {
    String enteredUsername = _cp5.get(Textfield.class, "username").getText();
    String enteredPassword = _cp5.get(Textfield.class, "password").getText();

    boolean validStaff = false;
    for (TableRow row : _table.rows())
    {
      if (row.getString("Staff").equals(enteredUsername))
      {
        validStaff = true;
        break;
      }
    }

    if (validStaff && enteredPassword.equals(_password))
    {
      _isAuthenticated = true;
    } else {
      _authFailed = true;
    }
  }

  public Boolean getIsCancelled()
  {
    return _isCancelled;
  }

  public Boolean getAuthFailed()
  {
    return _authFailed;
  }

  public String getEnteredUsername()
  {
    return _cp5.get(Textfield.class, "username").getText();
  }

  public void mousePressed(int x, int y)
  {
    if (_confirmButton.isClicked(x, y))
    {
      authenticate();
      _confirmButton.deselectObject();
    }
    if (_cancelButton.isClicked(x, y))
    {
      _isCancelled = true;
    }
    if (_scheduleButton.isClicked(x, y))
    {
      authenticate();
      if(_isAuthenticated)
      {
      _goToSchedule = true;
      }
      _scheduleButton.deselectObject();
    }
  }

  public void draw()
  {
    fill(#C5C4C4);
    rectMode(CENTER);
    rect(640, 360, 1280, 720);

    fill(0);
    textAlign(LEFT);
    text("Username:", 490, 304);
    text("Password:", 490, 355);

    _confirmButton.drawButton();
    _scheduleButton.drawButton();
    _cancelButton.drawButton();

    if (_authFailed == true)
    {
      text("Authentication Failed, check Username or Password", 660, 226);
    }
  }
}
