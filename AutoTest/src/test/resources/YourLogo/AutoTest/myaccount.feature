  Feature: YourLogo My Account page
  The logged in user should have access to features who are requires login
  
  Background:
    Given The home page is opened
    And The Sign In link is clicked
    
    @LogOut
    Scenario Outline: 1. The user should be able to access their personalized pages
      Given The '<field>' is filled with '<parameter>'
      Given The '<field2>' is filled with '<parameter2>'
      When The Sign In button is clicked
      Then The '<url>' should be loaded
      When The '<parameter3>' button is clicked
      Then The '<url2>' should be loaded
      Examples:
        | field | field2 | parameter         | parameter2 | parameter3    			| url                                                             | url2                                                                                         |
        | email | passwd | valid@email.com   | password   | mywishlist    			| http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?fc=module&module=blockwishlist&controller=mywishlist |    
        | email | passwd | valid@email.com   | password   | orders        			| http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?controller=history 																	 |    
        | email | passwd | valid@email.com   | password   | mycreditslips 		  | http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?controller=order-slip 															 |    
        | email | passwd | valid@email.com   | password   | myaddresses				  | http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?controller=addresses																 |    
        | email | passwd | valid@email.com   | password   | personalinformation | http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?controller=identity																	 |    

    @LogOut
    Scenario Outline: 2. The user should be able to get back to the My Account page from their personalized pages
      Given The '<field>' is filled with '<parameter>'
      Given The '<field2>' is filled with '<parameter2>'
      When The Sign In button is clicked
      Then The '<url>' should be loaded
      When The '<parameter3>' button is clicked
      Then The '<url2>' should be loaded
	    When The Back To Your Account button is clicked
      Then The '<url>' should be loaded 
      Examples:
        | field | field2 | parameter         | parameter2 | parameter3    			| url                                                             | url2                                                                                         |
        | email | passwd | valid@email.com   | password   | mywishlist    			| http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?fc=module&module=blockwishlist&controller=mywishlist |    
        | email | passwd | valid@email.com   | password   | orders        			| http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?controller=history 																	 |    
        | email | passwd | valid@email.com   | password   | mycreditslips 		  | http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?controller=order-slip 															 |    
        | email | passwd | valid@email.com   | password   | myaddresses				  | http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?controller=addresses																 |    
        | email | passwd | valid@email.com   | password   | personalinformation | http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php?controller=identity																	 |    
 
 
 		@LogOut
    Scenario Outline: 3. The user should be able to navigate back to the Home page via its dedicated button
      Given The '<field>' is filled with '<parameter>'
      Given The '<field2>' is filled with '<parameter2>'
      When The Sign In button is clicked
      Then The '<url>' should be loaded
      When The Home icon is clicked
      Then The '<url2>' should be loaded
      When The first last button is clicked
      Then The '<url>' should be loaded
      When The Home button is clicked
      Then The '<url2>' should be loaded      
      Examples:
        | field | field2 | parameter         | parameter2 | url                                                             | url2                                    |
        | email | passwd | valid@email.com   | password   | http://automationpractice.com/index.php?controller=my-account		| http://automationpractice.com/index.php | 
        