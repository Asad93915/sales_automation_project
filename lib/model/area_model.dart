class AreaModel {
  List<Areas>? areas;

  AreaModel({this.areas});

  AreaModel.fromJson(Map<String, dynamic> json) {
    if (json['Areas'] != null) {
      areas = <Areas>[];
      json['Areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.areas != null) {
      data['Areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  int? iD;
  String? name;

  Areas({this.iD, this.name});

  Areas.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    return data;
  }
}
