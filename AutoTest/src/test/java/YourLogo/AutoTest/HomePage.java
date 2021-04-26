package YourLogo.AutoTest;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;
import java.util.Optional;

public class HomePage {

	private static final String PAGE_URL = "http://automationpractice.com/";

	@FindBy(className = "login")
	private WebElement signInLink;

	@FindBy(id = "SubmitLogin")
	private WebElement signInButton;

	@FindBy(id = "SubmitCreate")
	private WebElement registrationButton;

	@FindBy(id = "submitAccount")
	private WebElement submitAccount;

	@FindBy(className = "logout")
	private WebElement signOutLink;

	@FindBy(className = "icon-list-ol")
	private WebElement myOrdersButton;

	@FindBy(className = "icon-ban-circle")
	private WebElement myCreditSlipsButton;

	@FindBy(className = "icon-building")
	private WebElement myAddressesButton;

	@FindBy(className = "icon-user")
	private WebElement myPersonalInformationButton;

	@FindBy(className = "icon-heart")
	private WebElement myWishListButton;

	@FindBy(className = "icon-home")
	private WebElement homeIcon;

	@FindBy(className = "account")
	private WebElement firstLastButton;

	@FindBy(className = "icon-chevron-left")
	private WebElement homeButton;

	private WebDriver driver;

	protected HomePage(WebDriver driver) {
		this.driver = driver;
		driver.get(PAGE_URL);
		PageFactory.initElements(driver, this);
	}

	public void clickSignInLink() {
		signInLink.click();
	}

	public void clickSignInButton() {
		signInButton.click();
	}

	public void clickSignOutLink() {
		signOutLink.click();
	}

	public void clickRegistrationButton() {
		registrationButton.click();
	}

	public void clickmyOrdersButton() {
		myOrdersButton.click();
	}

	public void clickmyCreditSlipsButton() {
		myCreditSlipsButton.click();
	}

	public void clickmyAddressesButton() {
		myAddressesButton.click();
	}

	public void clickMyPersonalInformationButton() {
		myPersonalInformationButton.click();
	}

	public void clickmyWishListButton() {
		myWishListButton.click();
	}

	public void clickHomeIcon() {
		homeIcon.click();
	}

	public void clickFirstLastButton() {
		firstLastButton.click();
	}

	public Optional<String> getErrorMessage(String idSelector) {
		Optional<WebElement> error = getError(idSelector);
		if (error.isPresent()) {
			WebElement errorElement = error.get();
			return Optional.of(errorElement.getText());
		} else {
			return Optional.empty();
		}
	}

	public void fillField(String field, String value) {
		getField(By.id(field)).sendKeys(value);
	}

	public WebElement getField(By locator) {
		return driver.findElement(locator);
	}

	public WebElement getSignInLink() {
		return signInLink;
	}

	public WebElement getSignInButton() {
		return signInButton;
	}

	public WebElement getRegistrationButton() {
		return registrationButton;
	}

	public WebElement getSignOutLink() {
		return signOutLink;
	}

	public WebElement getSubmitAccount() {
		return submitAccount;
	}

	private Optional<WebElement> getError(String idSelector) {
		List<WebElement> elements;
		if (idSelector.contentEquals("create_account_error")) {
			elements = driver.findElements(By.xpath("//*[@id=\"" + idSelector + "\"]/ol/li"));
		} else
			elements = driver.findElements(By.xpath("//*[@id=\"" + idSelector + "\"]/div[1]/ol/li"));
		if (elements.size() > 0) {
			return Optional.of(elements.get(0));
		} else {
			return Optional.empty();
		}
	}

	public String getURL(WebDriver driver) {
		this.driver = driver;
		String url = driver.getCurrentUrl();
		return url;
	}

	private WebElement getHomeButton() {
		List<WebElement> elements = driver.findElements(By.xpath("//*[@id=\"center_column\"]/ul/li"));
		return elements.get(0);
	}

	public void clickHomeButton() {
		WebElement homeButton = getHomeButton();
		homeButton.click();
	}

	private WebElement getBackToYourAccountButton() {
		List<WebElement> elements = driver.findElements(By.xpath(("//*[@class=\"footer_links clearfix\"]/li[1]/a")));
		System.out.println("List size: " + elements.size());
		return elements.get(0);
	}

	public void clickBackToYourAccountButton() {
		WebElement backToYourAccountButton = getBackToYourAccountButton();
		backToYourAccountButton.click();
	}

}
