class MarkAttendaceModel {
  Null? exception;
  int? resultType;
  String? message;
  Null? data;
  Null? validationErrors;

  MarkAttendaceModel(
      {this.exception,
        this.resultType,
        this.message,
        this.data,
        this.validationErrors});

  MarkAttendaceModel.fromJson(Map<String, dynamic> json) {
    exception = json['Exception'];
    resultType = json['ResultType'];
    message = json['Message'];
    data = json['Data'];
    validationErrors = json['ValidationErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Exception'] = this.exception;
    data['ResultType'] = this.resultType;
    data['Message'] = this.message;
    data['Data'] = this.data;
    data['ValidationErrors'] = this.validationErrors;
    return data;
  }
}
