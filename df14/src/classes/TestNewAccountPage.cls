public with sharing class TestNewAccountPage extends cinnamon.BaseTest{
	public override String getStartingPath(cinnamon.Context context) {
		return EditAccountPageObject.getInstance(context).getPathAndQuery();
	}

	public override void test(cinnamon.Context context) {
		EditAccountPageObject.getInstance(context)
			.enterRequiredInfo('my new account')
			.save();
	}
}