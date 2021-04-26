Feature: YourLogo sign in page test
 As a user I want to be informed when I miss to fill out or make an error 
 filling out all or one of the login/registration input fields
 
  Background:
    Given The home page is opened
    And The Sign In link is clicked
	  
    Scenario Outline: 1. The login page should provide the proper error messages for invalid inputs
      Given The '<field>' is filled with '<parameter>'
      Given The '<field2>' is filled with '<parameter2>'
      When The Sign In button is clicked
      Then The '<msg>' message is shown in the '<messeagebox>'
      Examples:
        | field | field2 | parameter         | parameter2 | msg                        | messeagebox          |
        | email | passwd |                   |            | An email address required. | center_column        |
        | email | passwd | invalid.email.com |            | Invalid email address.     | center_column        |
        | email | passwd | valid@email.com   |            | Password is required.      | center_column        |
        | email | passwd | valid@email.com   | pwd        | Invalid password.          | center_column        |
        | email | passwd | valid@email.com   | invalidpwd | Authentication failed.     | center_column        |
    
    @LogOut
    Scenario Outline: 2. The user should be logged in with the proper credentials
      Given The '<field>' is filled with '<parameter>'
      Given The '<field2>' is filled with '<parameter2>'
      When The Sign In button is clicked
      Then The '<url>' should be loaded
      Examples:
        | field | field2 | parameter         | parameter2 | url                                                           |
        | email | passwd | valid@email.com   | password   | http://automationpractice.com/index.php?controller=my-account |
      
    Scenario Outline: 3. The user should be able to log out
      Given The '<field>' is filled with '<parameter>'
      Given The '<field2>' is filled with '<parameter2>'
      When The Sign In button is clicked
      Then The '<url>' should be loaded
      When The Sign out link is clicked
      Then The '<url2>' should be loaded
      Examples:
        | field | field2 | parameter         | parameter2 | url                                                           	| url2                                                                              |
        | email | passwd | valid@email.com   | password   | http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?controller=authentication&back=my-account |    
    
    Scenario Outline: 4. The user should not be able to registrate with invalid e-mail
    	Given The '<field>' is filled with '<parameter>'
    	When The registration button is clicked
    	Then The '<msg>' message is shown in the '<messeagebox>'
      Examples:
        | field 			 | parameter         | msg                        																																		 								   		 | messeagebox          |
        | email_create |                   | Invalid email address.     																																													 | create_account_error |
        | email_create | invalid.email.com | Invalid email address.     																																													 | create_account_error |
        | email_create | valid@email.com   | An account using this email address has already been registered. Please enter a valid password or request a new one.  | create_account_error |
        
   Scenario Outline: 5. The user shouldn be able to navigate to the account creation page
    	Given The '<field>' is filled with '<parameter>'
    	When The registration button is clicked
    	Then The registration form should be displayed
      Examples:
        | field 			 | parameter         |
        | email_create | notused@email.com |