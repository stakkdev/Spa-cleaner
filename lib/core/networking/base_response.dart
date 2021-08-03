import 'network_response.dart';

const String ERROR_CODE = '-1';

class BaseResponse implements ResponseObject {
  String errorCode;
  String errorDescription;
  String statusCode;
  Error errorModel;

  BaseResponse({
    this.errorCode,
    this.statusCode,
    this.errorDescription,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        errorCode: json["ERROR_CODE"],
        errorDescription: json["message"],
        statusCode:json["status"],
      );

  @override
  readJson(Map<String, dynamic> json) {
    errorModel = json["error"]== null? null : Error.fromJson(json["error"]);
    errorCode= json["ERROR_CODE"];
    errorDescription=json["message"];
    statusCode = json["status"];

  }

  String getErrorMessage(){
    if(errorModel!=null){
      return errorModel.message!= null ? errorModel.message : errorDescription;
    }
    return errorDescription;
  }

  Map<String, dynamic> toJson() => {
    "status": statusCode == null ? null : statusCode,
    "ERROR_CODE": errorCode == null ? null : errorCode,
    "message": errorDescription == null ? null : errorDescription,
  };
}

class Error {
Error({
  this.message,
});

String message;

factory Error.fromJson(Map<String, dynamic> json) => Error(
message: json["message"]==null? null : json["message"],
);

}
