class UserResponseModel {
  Null? exception;
  int? resultType;
  String? message;
  UserModel? data;
  Null? validationErrors;

  UserResponseModel({this.exception, this.resultType, this.message, this.data, this.validationErrors});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    exception = json['Exception'];
    resultType = json['ResultType'];
    message = json['Message'];
    data = json['Data'] != null ? new UserModel.fromJson(json['Data']) : null;
    validationErrors = json['ValidationErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Exception'] = this.exception;
    data['ResultType'] = this.resultType;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['ValidationErrors'] = this.validationErrors;
    return data;
  }
}

class UserModel {
  bool? isRegionalHead;
  String? name;
  int? sOID;
  int? adminCompanyID;
  int? regionalHeadID;
  String? token;
  int? roleID;
  UserModel({this.isRegionalHead, this.name, this.sOID, this.adminCompanyID, this.regionalHeadID, this.token, this.roleID});

  UserModel.fromJson(Map<String, dynamic> json) {
  isRegionalHead = json['IsRegionalHead'];
  name = json['Name'];
  sOID = json['SOID'];
  adminCompanyID = json['AdminCompanyID'];
  regionalHeadID = json['RegionalHeadID'];
  token = json['Token'];
  roleID = json['RoleID'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['IsRegionalHead'] = this.isRegionalHead;
  data['Name'] = this.name;
  data['SOID'] = this.sOID;
  data['AdminCompanyID'] = this.adminCompanyID;
  data['RegionalHeadID'] = this.regionalHeadID;
  data['Token'] = this.token;
  data['RoleID'] = this.roleID;
  return data;
  }
}
