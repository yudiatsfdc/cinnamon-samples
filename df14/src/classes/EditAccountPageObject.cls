public class EditAccountPageObject extends cinnamon.PageObject {

    cinnamon.WebElement saveBtn,
            accountName,
            site,
            ratings;

    public override void initializePageObject() {
        saveBtn = getElement(new cinnamon.VisualforceLocator('apex:inputField', 'saveBtn'));
        accountName = getElement(new cinnamon.VisualforceLocator('apex:inputField', 'name'));
        site = getElement(new cinnamon.VisualforceLocator('apex:inputField', 'site'));
        ratings = getElement(new cinnamon.VisualforceLocator('apex:inputField', 'rating'));
    }

    public EditAccountPageObject clickSave() {
        if (saveBtn == null) {
            saveBtn = getElement(new cinnamon.VisualforceLocator('apex:commandButton', 'saveBtn'));
        }
        saveBtn.click();
        selenium.waitForPageToLoad('3000');
        return this;
    }

    public EditAccountPageObject typeAccountName(String data) {
        if (accountName == null) {
            accountName = getElement(new cinnamon.VisualforceLocator('apex:inputField', 'name'));
        }
        accountName.sendKeys(data);
        return this;
    }

    public EditAccountPageObject typeAccountSite(String data) {
        if (site == null) {
            accountName = getElement(new cinnamon.VisualforceLocator('apex:inputField', 'site'));
        }
        site.sendKeys(data);
        return this;
    }
}