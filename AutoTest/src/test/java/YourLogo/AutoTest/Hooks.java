package YourLogo.AutoTest;

import io.cucumber.java.After;

public class Hooks {

	StepDefinitions stepDef = new StepDefinitions();
	
	@After("@LogOut")
    public void afterLogOut(){
		stepDef.theSignOutLinkIsClicked();	        
    }
	
}
