// File: lib/paket_laundry_page.dart

import 'package:flutter/material.dart';
import 'paket_laundry_detail.dart'; // Import halaman detail paket laundry

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paket Laundry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PaketLaundryPage(),
    );
  }
}

class PaketLaundryPage extends StatelessWidget {
  // Contoh data paket laundry (biasanya data ini akan diambil dari database atau sumber data lainnya)
  final List<PaketLaundry> dataPaket = [
    PaketLaundry(
      id: 1,
      nama: 'Paket Reguler',
      deskripsi: 'Cuci dan setrika pakaian',
      harga: 50000,
      items: [
        PaketItem(nama: 'Cuci Pakaian'),
        PaketItem(nama: 'Setrika Pakaian'),
      ],
    ),
    PaketLaundry(
      id: 2,
      nama: 'Paket Premium',
      deskripsi: 'Cuci, setrika, dan lipat pakaian',
      harga: 75000,
      items: [
        PaketItem(nama: 'Cuci Pakaian'),
        PaketItem(nama: 'Setrika Pakaian'),
        PaketItem(nama: 'Lipat Pakaian'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paket Laundry'),
      ),
      body: ListView.builder(
        itemCount: dataPaket.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaketDetailPage(paket: dataPaket[index]),
                ),
              );
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dataPaket[index].nama,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      dataPaket[index].deskripsi,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Harga: Rp ${dataPaket[index].harga.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Class untuk menyimpan informasi paket laundry
class PaketLaundry {
  final int id;
  final String nama;
  final String deskripsi;
  final double harga;
  final List<PaketItem> items;

  PaketLaundry({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.items,
  });
}

// Class untuk menyimpan item-item dalam paket laundry
class PaketItem {
  final String nama;

  PaketItem({required this.nama});
}
