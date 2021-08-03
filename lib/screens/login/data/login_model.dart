
import 'package:spa_app/core/networking/base_response.dart';

class LoginModel extends BaseResponse {
  LoginModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.user,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  UserModel user;

  @override
  readJson(Map<String, dynamic> json) {
    super.readJson(json);
    accessToken = json["access_token"] == null ? null : json["access_token"];
    tokenType = json["token_type"] == null ? null : json["token_type"];
    expiresIn = json["expires_in"] == null ? null : json["expires_in"];
    user = json["user"] == null ? null : UserModel.fromJson(json["user"]);
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    accessToken: json["access_token"] == null ? null : json["access_token"],
    tokenType: json["token_type"] == null ? null : json["token_type"],
    expiresIn: json["expires_in"] == null ? null : json["expires_in"],
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken == null ? null : accessToken,
    "token_type": tokenType == null ? null : tokenType,
    "expires_in": expiresIn == null ? null : expiresIn,
    "user": user == null ? null : user.toJson(),
  };
}

class UserModel {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.image,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.status,
    this.role,
    this.jobType,
    this.deviceId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String image;
  String email;
  String phone;
  dynamic emailVerifiedAt;
  String status;
  String role;
  dynamic jobType;
  dynamic deviceId;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    image: json["image"] == null ? null : json["image"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    emailVerifiedAt: json["email_verified_at"],
    status: json["status"] == null ? null : json["status"],
    role: json["role"] == null ? null : json["role"],
    jobType: json["job_type"],
    deviceId: json["device_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "image": image == null ? null : image,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "email_verified_at": emailVerifiedAt,
    "status": status == null ? null : status,
    "role": role == null ? null : role,
    "job_type": jobType,
    "device_id": deviceId,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
