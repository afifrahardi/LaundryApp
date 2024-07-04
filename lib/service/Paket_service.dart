import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/Paket_laundry.dart';

class PaketService {
Future<List<Paket>> listData() async {
final Response response = await ApiClient().get('paket');
final List data = response.data as List;
List<Paket> result = data.map((json) => Paket.fromJson(json)).toList();
return result;
}

Future<Paket> simpan(Paket paket) async {
var data = paket.toJson();
final Response response = await ApiClient().post('paket', data);
Paket result = Paket.fromJson(response.data);
return result;
}

 Future<Paket> ubah(Paket paket, String id) async {
 var data = paket.toJson();
 final Response response = await ApiClient().put('paket/${id}', data);
 print(response);
 Paket result = Paket.fromJson(response.data);
 return result;
 }

 Future<Paket> getById(String id) async {
 final Response response = await ApiClient().get('paket/${id}');
 Paket result = Paket.fromJson(response.data);
 return result;
}

 Future<Paket> hapus(Paket paket) async {
 final Response response = await ApiClient().delete('paket/${paket.id}');
 Paket result = Paket.fromJson(response.data);
 return result;
 }
 }