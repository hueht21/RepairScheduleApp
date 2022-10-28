class RepairSchedule {
  String id;
  String name;
  String address;
  String phone;
  String note;
  String time;
  String repair;
  String date;
  int status;

  RepairSchedule({required this.id, required this.name, required this.address, required this.phone, required this.note, required this.time, required this.repair, required this.date, required this.status});

  factory RepairSchedule.fromMap(Map<String, dynamic> json) => RepairSchedule(id: "${json["id"]}", name: "${json["Name"]}", address: "${json["Address"]}", phone:  "${json["Phone"]}", note:  "${json["Note"]}", time:  "${json["Time"]}", repair:  "${json["Repair"]}", date:  "${json["Date"]}", status: json["Status"]);
  factory RepairSchedule.fromMap2(Map<String, dynamic> json)
  => RepairSchedule(id: json["id"], name: json["Name"],
      address: json["Address"], phone: json["Phone"], note:  json["Note"], time: json["Time"],
      repair: json["Repair"], date: json["Date"],status: json["Status"]);

  Map<String, dynamic> toJson() => {
    "id" : id,
    "Name": name,
    "Date": date,
    "Time": time,
    "Note": note,
    "Status": status,
    "Repair": repair,
    "Phone": phone,
    "Address": address,

  };

}