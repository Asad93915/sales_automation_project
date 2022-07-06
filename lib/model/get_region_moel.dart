
class GetRegionModel {
  List<RegionList>? regionList;

  GetRegionModel({this.regionList});

  GetRegionModel.fromJson(Map<String, dynamic> json) {
    if (json['RegionList'] != null) {
      regionList = <RegionList>[];
      json['RegionList'].forEach((v) {
        regionList!.add(new RegionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.regionList != null) {
      data['RegionList'] = this.regionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RegionList {
  int? iD;
  String? name;

  RegionList({this.iD, this.name});

  RegionList.fromJson(Map<String, dynamic> json) {
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
