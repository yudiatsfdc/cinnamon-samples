public class TestEditAccountPage extends cinnamon.BaseTest {

    public override void setup(cinnamon.Context context) {
        Account acc = new Account();
        acc.name = 'Account' + System.currentTimeMillis();
        insert acc;
        context.put('accId', acc.Id);
    }

    public override String getStartingPath(cinnamon.Context context) {
        Map<String, String> params = new Map<String, String>();
        params.put('accId', context.getString('accId'));
        EditAccountPageObject page = EditAccountPageObject.getInstance(context);
        return page.getPathAndQuery( params );
    }

    public override void test(cinnamon.Context context) {
        EditAccountPageObject page = EditAccountPageObject.getInstance(context);
        page.enterRequiredInfo('San Francisco')
            .save();

        String accId = context.getString('accId');
        Account a = [select name, site, rating from Account where Id = :accId];
        System.assert(a != null);
        System.assertEquals('San Francisco', a.name);
    }

    public override void tearDown(cinnamon.Context context) {
        List<ID> Ids = new List<ID>();
        Ids.add(context.getString('accId'));
        Database.delete(Ids);
    }
}