import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Transaksi.dart'; 
import '../model/Transaksi.dart'; 
import 'Transaksi_detail.dart';
  
class TransaksiItem extends StatelessWidget {
  final Transaksi transaksi;

  const TransaksiItem({super.key, required this.transaksi});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(transaksi.status_bayar),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Batas Waktu: ${transaksi.batas_waktu}"),
              Text("Status Bayar: ${transaksi.status_bayar}"),
              Text("Nama Member: ${transaksi.nama_member}"),
              Text("Pilih Paket: ${transaksi.pilih_paket}"),
              Text("Isi Kuantitas: ${transaksi.isi_kuantitas}"),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TransaksiDetail(transaksi: transaksi)),
        );
      },
    );
  }
}