// File: lib/paket_laundry_detail.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/paket_laundry_page.dart';

class PaketDetailPage extends StatelessWidget {
  final PaketLaundry paket;

  PaketDetailPage({required this.paket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Paket Laundry'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              paket.nama,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              paket.deskripsi,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: paket.items
                  .map((item) => Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          '- ${item.nama}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Harga: Rp ${paket.harga.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
