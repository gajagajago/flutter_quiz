import 'package:flutter/material.dart';
import 'asset.dart';

class Assets extends StatelessWidget {
  final Future<List<dynamic>> assets;

  Assets(this.assets);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: assets,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  height: 100,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 5.5,
                    shrinkWrap: true,
                    children: [
                      ...(snapshot.data as List<dynamic>)
                          .map((e) => Asset(e))
                    ],
                  ),
                )
              );
            } else {
              return Container();
            }
          }
        )
      ],
    );
  }
}