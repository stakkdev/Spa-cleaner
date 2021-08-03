class NotificationModel {
  NotificationModel({
    this.data,
    this.status,
    this.message,
  });

  List<String> data;
  String status;
  String message;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    data: json["data"] == null ? [] : List<String>.from(json["data"].map((x) => x)),
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}
