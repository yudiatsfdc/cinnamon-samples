public class EditAccountPageObject extends cinnamon.PageObject {

    cinnamon.WebElement saveBtn,
            accountName;
    String name;

    public override void initializePageObject() {
        saveBtn = getElement(new cinnamon.VisualforceLocator('apex:inputField', 'saveBtn'));
        accountName = getElement(new cinnamon.VisualforceLocator('apex:inputField', 'name'));
    }

    public override String getPathAndQuery(Map<String, String> params) { 
        if (params==null) {
            return '/apex/editAccountPage';
        } else {
            return '/apex/editAccountPage?id=' + params.get('accId'); 
        }
    }    

    public EditAccountPageObject save() {
        saveBtn.click();
        getWait().until(cinnamon.ExpectedConditions.titleTocontain(this.name));
        return this;
    }

    public EditAccountPageObject enterRequiredInfo(String name) {
        this.name = name;
        accountName.sendKeys(name);
        return this;
    }

    public static EditAccountPageObject getInstance(cinnamon.Context context) {
        EditAccountPageObject page = (EditAccountPageObject) context.getPageObject(EditAccountPageObject.class);
        return page;       
    }

}