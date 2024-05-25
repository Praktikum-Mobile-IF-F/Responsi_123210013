import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsi/models/favourites.dart';


class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<FavouritePage> {
  late Box<Kopis> kopisBox;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future<void> openBox() async {
    kopisBox = await Hive.openBox<Kopis>('favourites');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kopisBox == null
          ? Center(child: CircularProgressIndicator())
          : ValueListenableBuilder(
        valueListenable: kopisBox.listenable(),
        builder: (context, Box<Kopis> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No bookmarks yet'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              Kopis? kopi = box.getAt(index);
              return ListTile(
                title: Text(kopi?.name ?? 'No Name'),
                subtitle: Text(kopi?.price ?? 'No Price'),
                leading: kopi?.imageUrl != null
                    ? Image.network(kopi!.imageUrl!)
                    : null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        box.deleteAt(index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
