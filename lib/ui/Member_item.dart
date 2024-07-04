import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Member.dart'; 
import '../model/Member.dart'; 
import 'Member_detail.dart';
  
class MemberItem extends StatelessWidget {
  final Member member;

  const MemberItem({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(member.nama),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Jenis Kelamin: ${member.jenis_kelamin}"),
              Text("Tanggal Lahir: ${member.tanggal_lahir}"),
              Text("Nomor Telpon: ${member.nomor_telepon}"),
              Text("Alamat: ${member.alamat}"),
              Text("Email: ${member.email}"),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MemberDetail(member: member)),
        );
      },
    );
  }
}