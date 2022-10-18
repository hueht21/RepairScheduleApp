class Repair {// đây đối tượng này của mình bcos thông tin để hiển thi lên map thay vì mình fixx cứng ấy, dl mình lấy
  // oẻ trên firebase về
  String? id;
  String? name;
  int age;
  String? address;
  int star;
  String? phone;
  double latitude;
  double longitude;

  Repair({required this.id,required this.name, required this.age, required this.address,required this.star, required this.latitude, required this.longitude, required this.phone});

  factory Repair.fromJson(Map<String,dynamic> json) =>
      Repair(id: json["id"], name: json["Name"], age: json["Age"],
          address: json["Address"], star: json["Star"], latitude: json["Latitude"], longitude: json["Longitude"],phone: json["Phone"]);

  factory Repair.fromJsonString(Map<String,dynamic> json) =>
      Repair(id: "${json["id"]}", name: "${json["Name"]}", age: json["Age"],
          address: "${json["Address"]}", star: json["Star"], latitude: json["Latitude"], longitude: json["Longitude"], phone: json["Phone"]);
}