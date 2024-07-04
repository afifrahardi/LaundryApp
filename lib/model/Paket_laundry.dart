 class Paket { 
  String? id; 
  String namaPaket; 
  
  Paket({this.id, required this.namaPaket});

  factory Paket.fromJson(Map<String, dynamic> json) =>
 Paket(id: json["id"], namaPaket: json["nama_paket"],);

 Map<String, dynamic> toJson() => {"nama_paket": namaPaket};
 
  } 