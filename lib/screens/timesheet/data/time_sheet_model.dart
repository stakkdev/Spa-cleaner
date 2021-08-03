class TimeSheetModel {
  TimeSheetModel({
    this.data,
    this.status,
  });

  List<JobData> data;
  String status;

  factory TimeSheetModel.fromJson(Map<String, dynamic> json) => TimeSheetModel(
    data: json["data"] == null ? null : List<JobData>.from(json["data"].map((x) => JobData.fromJson(x))),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status == null ? null : status,
  };
}

class JobData {
  JobData({
    this.dateTime,
    this.startTime,
    this.endTime,
    this.name,
    this.propertyName,
    this.propertyAddress,
    this.frequency,
  });

  String dateTime;
  String startTime;
  String endTime;
  String name;
  String propertyName;
  String propertyAddress;
  String frequency;

  factory JobData.fromJson(Map<String, dynamic> json) => JobData(
    dateTime: json["dateTime"] == null ? null : json["dateTime"],
    startTime: json["start_time"] == null ? null : json["start_time"],
    endTime: json["end_time"] == null ? null : json["end_time"],
    name: json["name"] == null ? null : json["name"],
    propertyName: json["property_name"] == null ? null : json["property_name"],
    propertyAddress: json["property_address"] == null ? null : json["property_address"],
    frequency: json["frequency"] == null ? null : json["frequency"],
  );

  Map<String, dynamic> toJson() => {
    "dateTime": dateTime == null ? null : dateTime,
    "start_time": startTime == null ? null : startTime,
    "end_time": endTime == null ? null : endTime,
    "name": name == null ? null : name,
    "property_name": propertyName == null ? null : propertyName,
    "property_address": propertyAddress == null ? null : propertyAddress,
    "frequency": frequency == null ? null : frequency,
  };
}
