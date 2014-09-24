// update orgsettings
cinnamon.CN_CinnamonConfigApi.ConfigRequest req = new cinnamon.CN_CinnamonConfigApi.ConfigRequest();
req.proxyUsername = '${cn.sauce.username}';
req.proxyToken = '${cn.sauce.token}';
cinnamon.CN_CinnamonConfigApi.upsertConfig(req, null);
