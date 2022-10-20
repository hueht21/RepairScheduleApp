class RepairSchedule {
  String id;
  String name;
  String address;
  String phone;
  String note;
  String time;
  String repair;
  String date;

  RepairSchedule({required this.id, required this.name, required this.address, required this.phone, required this.note, required this.time, required this.repair, required this.date});

  factory RepairSchedule.fromMap(Map<String, dynamic> json) => RepairSchedule(id: "${json["id"]}", name: "${json["Name"]}", address: "${json["Address"]}", phone:  "${json["Phone"]}", note:  "${json["Note"]}", time:  "${json["Time"]}", repair:  "${json["Repair"]}", date:  "${json["Date"]}");
}