class GetCitiesModel {
  List<Cities>? cities;

  GetCitiesModel({this.cities});

  GetCitiesModel.fromJson(Map<String, dynamic> json) {
    if (json['Cities'] != null) {
      cities = <Cities>[];
      json['Cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cities != null) {
      data['Cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? iD;
  String? name;

  Cities({this.iD, this.name});

  Cities.fromJson(Map<String, dynamic> json) {
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
