import 'package:flutter/material.dart';
import '../model/Paket_laundry.dart';
import '../service/Paket_service.dart';
import 'Paket_detail.dart';
import 'Paket_form.dart';
import 'Paket_item.dart';
import '../widget/sidebar.dart';

class PaketPage extends StatefulWidget {
  const PaketPage({Key? key}) : super(key: key);
  _PaketPageState createState() => _PaketPageState();
  }
  
  class _PaketPageState extends State<PaketPage> {
    Stream<List<Paket>> getList() async* {
      List<Paket> data = await PaketService().listData();
      yield data;
      }

@override
Widget build(BuildContext context) {
  return Scaffold(
    drawer: Sidebar(),
    appBar: AppBar(
      title: const Text("Data Paket"),
      actions: [
        GestureDetector(
          child: const Icon(Icons.add),
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) =>PaketForm()));
              },
            )          
          ],
        ),
        body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
          snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return PaketItem(paket: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}