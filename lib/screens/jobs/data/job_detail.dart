class JobDetailModel {
  JobDetailModel({
    this.data,
    this.status,
  });

  Data data;
  String status;

  factory JobDetailModel.fromJson(Map<String, dynamic> json) => JobDetailModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "status": status == null ? null : status,
  };
}

class Data {
  Data({
    this.id,
    this.propertyName,
    this.entryCode,
    this.address,
    this.details,
    this.blocksCount,
    this.entranceCount,
    this.longitude,
    this.latitude,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.isStarted,
    this.jobId,
  });

  int id;
  String propertyName;
  String entryCode;
  String address;
  String details;
  String blocksCount;
  String entranceCount;
  String longitude;
  String latitude;
  String status;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String isStarted;
  String jobId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    propertyName: json["property_name"] == null ? null : json["property_name"],
    entryCode: json["entry_code"] == null ? null : json["entry_code"],
    address: json["address"] == null ? null : json["address"],
    details: json["details"] == null ? null : json["details"],
    blocksCount: json["blocks_count"] == null ? null : json["blocks_count"],
    entranceCount: json["entrance_count"] == null ? null : json["entrance_count"],
    longitude: json["longitude"] == null ? "0" : json["longitude"],
    latitude: json["latitude"] == null ? "0" : json["latitude"],
    status: json["status"] == null ? null : json["status"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isStarted: json["is_started"] == null ? null : json["is_started"],
    jobId: json["job_id"] == null ? null : json["job_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "property_name": propertyName == null ? null : propertyName,
    "entry_code": entryCode == null ? null : entryCode,
    "address": address == null ? null : address,
    "details": details == null ? null : details,
    "blocks_count": blocksCount == null ? null : blocksCount,
    "entrance_count": entranceCount == null ? null : entranceCount,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
    "status": status == null ? null : status,
    "deleted_at": deletedAt,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "is_started": isStarted == null ? null : isStarted,
    "job_id": jobId == null ? null : jobId,
  };
}