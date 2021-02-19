import 'package:flutter/material.dart';
import '../../modals/modal_add_transaction.dart';
import 'package:provider/provider.dart';
import '../../providers/assets_provider.dart';

class AssetAppFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Asset app floating context: ${context.watch<AssetsProvider>().loading}");
    return FloatingActionButton(
      child: const Icon(Icons.add_rounded),
      backgroundColor: Colors.blue,
      onPressed: () => showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (_) => ChangeNotifierProvider.value(
            value: context.read<AssetsProvider>(),
            child: ModalAddTransaction(),
          )
      ),
    );
  }
}