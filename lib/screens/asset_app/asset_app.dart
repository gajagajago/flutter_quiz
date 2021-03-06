import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../commons/app_bar.dart';
import '../../providers/user_auth/authenticate.dart';
import '../../providers/asset_app/assets_provider.dart';
import '../../providers/asset_app/transactions_provider.dart';
import 'asset_app_body.dart';
import 'asset_app_floating.dart';

class AssetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String authToken = context.read<Authenticate>().authToken;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AssetsProvider>(create: (_) => AssetsProvider(authToken: authToken)),
        ChangeNotifierProvider<TransactionsProvider>(create: (_) => TransactionsProvider(authToken: authToken))
      ],
      child: AssetAppScaffold()
    );
  }
}

class AssetAppScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: '자산관리'),
        body: AssetAppBody(),
        floatingActionButton: AssetAppFloating()
    );
  }
}
