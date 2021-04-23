Feature: YourLogo sign in page test
 As a user
 I want to be informed when I miss to fill out or make an error filling out all or one of the the login input fields
 
  Background:
    Given The home page is opened
    And The Sign In link is clicked
	  
    Scenario Outline: 1. The login page should provide the proper error messages for invalid inputs
      Given The '<field>' is filled with '<parameter>'
      Given The '<field2>' is filled with '<parameter2>'
      When The Sign In button is clicked
      Then The '<msg>' message is shown
      Examples:
        | field | field2 | parameter         | parameter2 | msg                        |
        | email | passwd |                   |            | An email address required. |
        | email | passwd | invalid.email.com |            | Invalid email address.     |
        | email | passwd | valid@email.com   |            | Password is required.      |
        | email | passwd | valid@email.com   | pwd        | Invalid password.          |
        | email | passwd | valid@email.com   | invalidpwd | Authentication failed.     |
    
    @LogOut
    Scenario Outline: 2. The user should be logged in with the proper credentials
      Given The '<field>' is filled with '<parameter>'
      Given The '<field2>' is filled with '<parameter2>'
      When The Sign In button is clicked
      Then The '<url>' should be loaded
      Examples:
        | field | field2 | parameter         | parameter2 | url                                                           |
        | email | passwd | valid@email.com   | password   | http://automationpractice.com/index.php?controller=my-account |
    
    @LogOut    
    Scenario Outline: 3. The user should be able to log out
      Given The '<field>' is filled with '<parameter>'
      Given The '<field2>' is filled with '<parameter2>'
      When The Sign In button is clicked
      Then The '<url>' should be loaded
      When the Sign out link is clicked
      Then The '<url2>' should be loaded
      Examples:
        | field | field2 | parameter         | parameter2 | url                                                           										| url2                                                                              |
        | email | passwd | valid@email.com   | password   | http://automationpractice.com/index.php?controller=my-account											| http://automationpractice.com/index.php?controller=authentication&back=my-account |    
