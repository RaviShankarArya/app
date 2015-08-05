module ConfigCenter
  module User
    # xxxx@yyyy.zzz format
    EMAIL_FORMAT_REG_EXP = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
    # xxx-xxx-xxxx format
    PHONE_FORMAT_REG_EXP = /\A([0-9\(\)\/\+ \-]){3}-([0-9\(\)\/\+ \-]){3}-([0-9\(\)\/\+ \-]){4}\z/i
    # Password regex format
    # Password format validations
    # - Minimum of 8 digits
    # - At least one upper case letter
    # - At least one lower case letter
    # - At least one digit
    # - No special characters are allowed
    PASSWORD_FORMAT_REG_EXP = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}\z/

    FIRST_NAME_REG_EXP = /\A[A-z]+\z/
    LAST_NAME_REG_EXP = /\A[A-z]+\z/

  end
end