import 'package:flutter/material.dart';
import 'package:responsi/models/favourites.dart';
import 'package:responsi/models/kopi_model.dart';

import '../main.dart';

class DetailPage extends StatefulWidget {
  final KopiModel detail;

  const DetailPage({Key? key, required this.detail}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.detail.name ?? 'Nama Kopi',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () async {
              if (!box.values.any((kopi) => kopi.name == widget.detail.name)) {
                box.add(Kopis(
                  name: widget.detail.name!,
                  price: widget.detail.price!.toString(),
                  region: widget.detail.region!,
                  flavorProfile: widget.detail.flavorProfile!,
                  grindOption: widget.detail.grindOption!,
                  roastLevel: widget.detail.roastLevel.toString(),
                  imageUrl: widget.detail.imageUrl!,
                ));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Successfully added to favourites')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Already Favourites')),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.detail.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama Kopi: ${widget.detail.name ?? 'N/A'}'),
                      Text('Harga: ${widget.detail.price != null ? 'Rp ${widget.detail.price}' : 'N/A'}'),
                      Text('Deskripsi: ${widget.detail.description ?? 'N/A'}'),
                      Text('Region: ${widget.detail.region ?? 'N/A'}'),
                      Text('Berat: ${widget.detail.weight != null ? '${widget.detail.weight}g' : 'N/A'}'),
                      Text('Profil Rasa: ${widget.detail.flavorProfile?.join(', ') ?? 'N/A'}'),
                      Text('Opsi Grind: ${widget.detail.grindOption?.join(', ') ?? 'N/A'}'),
                      Text('Level Roasting: ${widget.detail.roastLevel ?? 'N/A'}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
