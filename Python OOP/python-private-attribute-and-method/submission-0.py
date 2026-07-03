class PasswordManager:
    def __init__(self, given_password):
        self.__password = given_password  
    
    # TODO: Implement the verify_password method
    def verify_password(self, given_password):
        if self.__password == given_password:
            return True
        else:
            return False




# Don't modify the code below this line
my_password = PasswordManager("secret123")
print(my_password.verify_password("secret123"))  # Should print: True
print(my_password.verify_password("wrong"))      # Should print: False
