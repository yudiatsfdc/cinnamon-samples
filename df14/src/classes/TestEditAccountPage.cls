public class TestEditAccountPage extends cinnamon.BaseTest {

    public override void setup(cinnamon.Context context) {
        Account acc = new Account();
        acc.name = 'Account' + System.currentTimeMillis();
        insert acc;
        context.put('accId', acc.Id);
    }

    public override String getStartingPath(cinnamon.Context context) {
        return '/apex/editAccount?id=' + (String) context.get('accId');
    }

    public override void test(cinnamon.Context context) {
        String accId = (String) context.get('accId');

        EditAccountPageObject page = (EditAccountPageObject) context.getPageObject(EditAccountPageObject.class);
        page.initializePageObject();

        page.typeAccountSite('San Francisco')
            .clickSave();

        Account a = [select name, site, rating from Account where Id = :accId];
        System.assert(a != null);
        System.assertEquals(a.site, 'San Francisco');
    }

    public override void tearDown(cinnamon.Context context) {
        List<ID> Ids = new List<ID>();
        Ids.add((String) context.get('accId'));
        Database.delete(Ids);
    }
}