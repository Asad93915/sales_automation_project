class DailyActivityModel {
  List<DayInOutList>? dayInOutList;

  DailyActivityModel({this.dayInOutList});

  DailyActivityModel.fromJson(Map<String, dynamic> json) {
    if (json['DayInOutList'] != null) {
      dayInOutList = <DayInOutList>[];
      json['DayInOutList'].forEach((v) {
        dayInOutList!.add(new DayInOutList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dayInOutList != null) {
      data['DayInOutList'] = this.dayInOutList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayInOutList {
  int? iD;
  String? value;

  DayInOutList({this.iD, this.value});

  DayInOutList.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Value'] = this.value;
    return data;
  }
}
