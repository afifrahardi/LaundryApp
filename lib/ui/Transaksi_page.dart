import 'package:flutter/material.dart';
import '../model/Transaksi.dart';
import '../service/Paket_service.dart';
import 'Transaksi_detail.dart';
import 'Transaksi_form.dart';
import 'Transaksi_item.dart';
import '../widget/sidebar.dart';

class PageTransaksi extends StatefulWidget {
  const PageTransaksi({super.key});

  @override
  _PageTransaksiState createState() => _PageTransaksiState();
}

class _PageTransaksiState extends State<PageTransaksi> {
  final List<Transaksi> _transaksi = [
    Transaksi(
      batas_waktu: '2024-07-17',
      status_bayar: 'Belum Bayar',
      nama_member: 'Marshella Putri',
      pilih_paket: 'Short',
      isi_kuantitas: '2',
    ),
    Transaksi(
      batas_waktu: '2024-07-18',
      status_bayar: 'Sudah Bayar',
      nama_member: 'Alvaro Narendra',
      pilih_paket: 'Short',
      isi_kuantitas: '1',
    ),
    Transaksi(
      batas_waktu: '2024-07-19',
     status_bayar: 'Sudah Bayar',
      nama_member: 'Areksa Adelio',
      pilih_paket: 'Short',
      isi_kuantitas: '2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Data Transaksi",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            GestureDetector(
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => TransaksiForm())));
              },
            )
          ],
          backgroundColor: const Color.fromARGB(255, 0, 42, 76)),
      body: ListView.builder(
        itemCount: _transaksi.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(_transaksi[index].nama_member),
            subtitle: Text('Status Bayar : ${_transaksi[index].status_bayar}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransaksiDetail(transaksi: _transaksi[index]),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
