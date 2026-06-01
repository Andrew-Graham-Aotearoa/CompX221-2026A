class LoginScreen
{
  private ControlP5 _cp5;
  private String _currentStaffName;
  private String _password;
  private ArrayList<TimeSlot> _timeSlots;
  private Boolean _isAuthenticated;
  private Boolean _isCancelled;
  private Boolean _authFailed;
  private Button _confirmButton;
  private Button _cancelButton;


  public LoginScreen
    (ControlP5 cp5,
    String password,
    String currentStaffName,
    ArrayList<TimeSlot> timeSlots)
  {
    _cp5 = cp5;
    _password = password;
    _currentStaffName = currentStaffName;
    _timeSlots = timeSlots;
    _isAuthenticated = false;
    _isCancelled = false;
    _authFailed = false;
    _confirmButton = new Button(640, 400, color(100, 200, 100), 120, 40, "CONFIRM");
    _cancelButton = new Button(640, 460, color(200, 100, 100), 120, 40, "CANCEL");

    _cp5.addTextfield("username")
      .setPosition(580, 280)
      .setSize(200, 30)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setText(_currentStaffName);

    _cp5.addTextfield("password")
      .setPosition(580, 330)
      .setLabel("")
      .setColorBackground(color(218, 217, 217))
      .setFont(createFont("Arial", 12))
      .setColorValue(color(0))
      .setSize(200, 30);
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
  }

  public Boolean getIsAuthenticated()
  {
    return _isAuthenticated;
  }



  public void authenticate()
  {
    String enteredUsername = _cp5.get(Textfield.class, "username").getText();
    String enteredPassword = _cp5.get(Textfield.class, "password").getText();
    String loadedStaffName = _timeSlots.get(0).getStaffName();
    
    if (enteredPassword.equals(_password) && enteredUsername.equals(loadedStaffName))
    {
      _isAuthenticated = true;
    } else
    {
      _isAuthenticated = false;
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
    }
    if (_cancelButton.isClicked(x, y))
    {
      _isCancelled = true;
    }
  }

  public void draw()
  {
    fill(#C5C4C4);
    rectMode(CENTER);
    rect(640, 360, 1280, 720);

    fill(0);
    textAlign(LEFT);
    text("Username:", 490, 300);
    text("Password:", 490, 345);

    _confirmButton.drawButton();
    _cancelButton.drawButton();
    
    if (_authFailed == true)
    {
     text("Authentication Failed, check Username or Password", 660, 226); 
    }
  }
}
