import 'package:flutter/material.dart';
import '../model/Transaksi.dart';
import 'Transaksi_update_form.dart';
import '../service/Paket_service.dart';

class TransaksiDetail extends StatelessWidget {
  final transaksi;

  const TransaksiDetail({super.key, required this.transaksi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Transaksi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 42, 76),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Batas Waktu             : ${transaksi.batas_waktu}'),
            SizedBox(height: 8.0),
            Text('Status Bayar             : ${transaksi.status_bayar}'),
            SizedBox(height: 8.0),
            Text('Nama Member          : ${transaksi.nama_member}'),
            SizedBox(height: 8.0),
            Text('Pilih Paket           : ${transaksi.pilih_paket}'),
            SizedBox(height: 8.0),
            Text('Isi Kuantitas  : ${transaksi.isi_kuantitas}'),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tombolUbah(context),
                _tombolHapus(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  _tombolUbah(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransaksiUpdateForm(transaksi: transaksi),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 0, 111, 78)),
      child: const Text("Ubah", style: TextStyle(color: Colors.white)),
    );
  }

  _tombolHapus(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implement your delete functionality here
        // For example, show a confirmation dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Hapus Transaksi"),
              content: Text("Apakah Anda yakin ingin menghapus transaksi ini?"),
              actions: [
                TextButton(
                  onPressed: () {
                    // If user confirms, perform the delete action
                    // For example, you can call a method to delete the pegawai
                    // Then navigate back to the previous screen
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pop(); // Navigate back to the previous screen
                  },
                  child:
                      const Text("Ya", style: TextStyle(color: Colors.white)),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                TextButton(
                  onPressed: () {
                    // If user cancels, just pop the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text("Tidak",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus", style: TextStyle(color: Colors.white)),
    );
  }
}