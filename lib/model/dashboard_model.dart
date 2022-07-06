

class DashboardModel {
  MainDashboard? mainDashboard;

  DashboardModel({this.mainDashboard});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    mainDashboard = json['MainDashboard'] != null
        ? new MainDashboard.fromJson(json['MainDashboard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainDashboard != null) {
      data['MainDashboard'] = this.mainDashboard!.toJson();
    }
    return data;
  }
}

class MainDashboard {
  int? targetValue;
  int? achivedValue;
  int? totalVisits;
  int? totalSampleDemand;
  int? totalSampleDeliver;
  int? totalSampleReturn;

  MainDashboard(
      {this.targetValue,
        this.achivedValue,
        this.totalVisits,
        this.totalSampleDemand,
        this.totalSampleDeliver,
        this.totalSampleReturn});

  MainDashboard.fromJson(Map<String, dynamic> json) {
    targetValue = json['targetValue'];
    achivedValue = json['achivedValue'];
    totalVisits = json['totalVisits'];
    totalSampleDemand = json['totalSampleDemand'];
    totalSampleDeliver = json['totalSampleDeliver'];
    totalSampleReturn = json['totalSampleReturn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['targetValue'] = this.targetValue;
    data['achivedValue'] = this.achivedValue;
    data['totalVisits'] = this.totalVisits;
    data['totalSampleDemand'] = this.totalSampleDemand;
    data['totalSampleDeliver'] = this.totalSampleDeliver;
    data['totalSampleReturn'] = this.totalSampleReturn;
    return data;
  }
}
