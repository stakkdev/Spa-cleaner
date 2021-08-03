import 'package:spa_app/core/networking/base_response.dart';

class JobModel extends BaseResponse{
  JobModel({
    this.jobs,
    this.status,
  });

  List<Job> jobs;
  String status;

  @override
  readJson(Map<String, dynamic> json) {
    super.readJson(json);
    jobs= json["jobs"] == null ? null : List<Job>.from(json["jobs"].map((x) => Job.fromJson(x)));
    status= json["status"] == null ? null : json["status"];
  }
  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    jobs: json["jobs"] == null ? null : List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "jobs": jobs == null ? null : List<dynamic>.from(jobs.map((x) => x.toJson())),
    "status": status == null ? null : status,
  };
}

class Job {
  Job({
    this.date,
    this.dayName,
    this.jobId,
    this.propertyId,
    this.frequency,
    this.paidOvertime,
    this.propertyName,
    this.entryCode,
    this.address,
    this.note,
    this.blocksCount,
    this.entranceCount,
    this.longitude,
    this.latitude,
  });

  String date;
  String dayName;
  String jobId;
  String propertyId;
  String frequency;
  String paidOvertime;
  String propertyName;
  String entryCode;
  String address;
  String note;
  String blocksCount;
  String entranceCount;
  String longitude;
  String latitude;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    date: json["date"] == null ? null : json["date"],
    dayName: json["dayName"] == null ? null : json["dayName"],
    jobId: json["job_id"] == null ? null : json["job_id"],
    propertyId: json["property_id"] == null ? null : json["property_id"],
    frequency: json["frequency"] == null ? null : json["frequency"],
    paidOvertime: json["paid_overtime"] == null ? null : json["paid_overtime"],
    propertyName: json["property_name"] == null ? null : json["property_name"],
    entryCode: json["entry_code"] == null ? null : json["entry_code"],
    address: json["address"] == null ? null : json["address"],
    note: json["note"] == null ? null : json["note"],
    blocksCount: json["blocks_count"] == null ? null : json["blocks_count"],
    entranceCount: json["entrance_count"] == null ? null : json["entrance_count"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date,
    "dayName": dayName == null ? null : dayName,
    "job_id": jobId == null ? null : jobId,
    "property_id": propertyId == null ? null : propertyId,
    "frequency": frequency == null ? null : frequency,
    "paid_overtime": paidOvertime == null ? null : paidOvertime,
    "property_name": propertyName == null ? null : propertyName,
    "entry_code": entryCode == null ? null : entryCode,
    "address": address == null ? null : address,
    "note": note == null ? null : note,
    "blocks_count": blocksCount == null ? null : blocksCount,
    "entrance_count": entranceCount == null ? null : entranceCount,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
  };
}
