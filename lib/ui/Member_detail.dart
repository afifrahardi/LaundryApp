import 'package:flutter/material.dart';
import '../model/Member.dart';
import 'Member_update_form.dart';
import '../service/Paket_service.dart';

class MemberDetail extends StatelessWidget {
  final member;

  const MemberDetail({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Member",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 42, 76),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Id             : ${member.id}'),
            SizedBox(height: 8.0),
            Text('Jenis Kelamin          : ${member.jenis_kelamin}'),
            SizedBox(height: 8.0),
            Text('Nama           : ${member.nama}'),
            SizedBox(height: 8.0),
            Text('Tanggal Lahir  : ${member.tanggal_lahir.toString()}'),
            SizedBox(height: 8.0),
            Text('Nomor Telepon  : ${member.nomor_telepon}'),
            SizedBox(height: 8.0),
            Text('Alamat          : ${member.alamat}'),
            SizedBox(height: 8.0),
            Text('Email          : ${member.email}'),
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
            builder: (context) => MemberUpdateForm(member: member),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
              title: Text("Hapus Member"),
              content: Text("Apakah Anda yakin ingin menghapus member ini?"),
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