package YourLogo.AutoTest;

import io.cucumber.java.After;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.util.Optional;
import java.util.concurrent.TimeUnit;

import static org.junit.Assert.*;

public class StepDefinitions {

	private static final int WAIT_TIME = 10;

	static WebDriver driver;

	public HomePage homePage = new HomePage(driver);

	static {
		WebDriverManager.chromedriver().setup();
		ChromeOptions options = new ChromeOptions();
		// options.setHeadless(true);
		// options.addArguments("--no-sandbox");
		driver = new ChromeDriver(options);
		driver.manage().timeouts().implicitlyWait(WAIT_TIME, TimeUnit.SECONDS);
	}

	@Given("The home page is opened")
	public void theHomePageIsOpened() {
		homePage = new HomePage(driver);
	}

	@And("The Sign In link is clicked")
	public void theSignInLinkIsClicked() {
		homePage.clickSignInLink();
	}

	@Given("The Sign In button is clicked")
	public void theSignInButtonIsClicked() {
		homePage.clickSignInButton();
	}

	@Given("The {string} is filled with {string}")
	public void theFieldIsFilledWithParameter(String field, String parameter) {
		homePage.fillField(field, parameter);
	}

	@Then("The {string} message is shown in the {string}")
	public void theMsgErrorMessageIsShown(String msg, String idSelector) {
		Optional<String> errorMessage = homePage.getErrorMessage(idSelector);
		if (errorMessage.isPresent()) {
			Assert.assertEquals(msg, errorMessage.get());
		} else {
			fail();
		}
	}

	@Then("The {string} should be loaded")
	public void theUrlIsLoaded(String url) {
		String currentUrl = homePage.getURL(driver);
		Assert.assertEquals(url, currentUrl);
	}

	@When("The Sign out link is clicked")
	public void theSignOutLinkIsClicked() {
		homePage.clickSignOutLink();
	}

	@When("The registration button is clicked")
	public void theRegistrationButtonIsClicked() {
		homePage.clickRegistrationButton();
	}

	@Then("The registration form should be displayed")
	public void theRegistrationFormIsDisplayed() {
		homePage.getSubmitAccount().isDisplayed();
	}

	@When("The {string} button is clicked")
	public void personalizedPageOpened(String page) {
		if (page.contentEquals("mywishlist")) {
			homePage.clickmyWishListButton();
		} else if (page.contentEquals("orders")) {
			homePage.clickmyOrdersButton();
		} else if (page.contentEquals("mycreditslips")) {
			homePage.clickmyCreditSlipsButton();
		} else if (page.contentEquals("myaddresses")) {
			homePage.clickmyAddressesButton();
		} else if (page.contentEquals("personalinformation")) {
			homePage.clickMyPersonalInformationButton();
		}
	}

	@When("The Home button is clicked")
	public void theHomeButtonIsClicked() {
		homePage.clickHomeButton();
	}

	@When("The first last button is clicked")
	public void theFirstLastButtonIsClicked() {
		homePage.clickFirstLastButton();
	}

	@When("The Home icon is clicked")
	public void theHomeIconIsClicked() {
		homePage.clickHomeIcon();
	}

	@When("The Back To Your Account button is clicked")
	public void theBackToYourAccountButtonIsClicked() {
		homePage.clickBackToYourAccountButton();
	}

}
