class Constants {

  static const String ENV = "https://bystakk.com/client/spa-cleaner/public/api/";
  //static const String ENV = "https://bystakk.com/client/spa-cleaner/public";

  static const String REGEX_USERNAME = "^[a-zA-Z0-9-_\\.@]+\$";
  static const String USERNAME_FORMATTER_PATTERN = "[a-zA-Z0-9.-._-_---]"; // Allowed - a-z A-Z 0-9 and dot(.), underscore, hyphen
  static const String PASSWORD_FORMATTER_PATTERN = "[a-z@-Z0-9_-_.-.!-!&-&---]"; // Allowed - a-z @ A-Z 0-9 _ . ! & -

  static const String REGEX_PASSWORD_POLICY = "^((?=.*[A-Z]+.*)(?=.*[a-z]+.*)(?=.*[0-9]+.*)(?=.*\\W+).*).{8}.*\$";
  static const String REGEX_PASSWORD_CAPITAL_LETTER = "^((?=.*[A-Z]+.*).*).{1}.*\$";
  static const String REGEX_PASSWORD_SMALL_LETTER = "^((?=.*[a-z]+.*).*).{1}.*\$";
  static const String REGEX_PASSWORD_NUMBER = "^((?=.*[0-9]+.*).*).{1}.*\$";
  static const String REGEX_PASSWORD_SPECIAL_CHAR = "^((?=.*\\W+).*).{1}.*\$";
  static const String REGEX_PASSWORD_LENGTH = "^(.*).{8}.*\$";

  static const String REGEX_PROPER_EMAIL = "^[!#\\\\\$%&'*+\\-\\/=?^_`{|}~\\w]+(\\.[!#\$%&'*+\\-\\/=?^_`{|}~\\w]+)*@[\\w\\-]+(\\.[\\w\\-]+)+([\\w\\-]*[\\w])\$";

  static const String FIELD_USERNAME = "USERNAME";
  static const String FIELD_PASSWORD = "PASSWORD";
  static const String FIELD_EMAIL = "EMAIL";

  static const String INVALID_SESSION = "INVALID_SESSION";
  static const String GENERIC_ERROR_CODE = "FE_GEN";
  static const String NO_INTERNET_ERROR_CODE = "FE_NO_INTERNET";
  static const String TIMEOUT_ERROR_CODE = "FE_TIMEOUT";
  static const String WRONG_PASSWORD = "FE_WRONG_PASSWORD";

  static const String HOUR = " hr ";
  static const String MINUTES = " min";

  static const String Service_id = "0000fff0-0000-1000-8000-00805f9b34fb";
  static const String Notify_id = "0000fff1-0000-1000-8000-00805f9b34fb";
  static const String TxUUID = "0000fff2-0000-1000-8000-00805f9b34fb";

  static const String UPPER_BODY = "Upper Body";
  static const String MID_BODY = "Mid Body";
  static const String LOWER_BODY = "Lower Body";

  static const String GOAL_RELAX = "Relax";
  static const String GOAL_REST = "Rest";
  static const String GOAL_FITNESS_RECOVERY = "Recover";

  static const String INITIAL_SLIDER_TEXT = "-";
  static const String INVALID_SESSION_DESCRIPTION = "Your session has expired. Please login again.";


  static const String TodayJob = "today-job";
  static const String WeekJob = "future-jobs";
}

