import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/configs/api_urls.dart';
import 'package:sales_automation_project/helper_services/custom_post_request_service.dart';
import 'package:sales_automation_project/model/mark_attandace_model.dart';
import 'package:sales_automation_project/providers/attendance_provider.dart';

class MarkAttendanceService {
  Future markAttendance(
      {required BuildContext context,
      required int userId,
      required int activityId,
      required int regionId,
      required int cityId,
      required int areaId}) async {
    try {
      Map _body = {
        "SalesOfficerID": userId,
        "DropDownID": activityId,
        "RegionID": regionId,
        "CityID": cityId,
        "AreaID": areaId
      };

      var res = await PostRequestService().httpPostRequest(
          url: markAttendanceUrl, body: _body, context: context);
      if (res != null) {
        MarkAttendaceModel attendaceModel = MarkAttendaceModel.fromJson(res);
        Provider.of<MarkAttendanceProvider>(context, listen: false)
            .updateAttendance(newAttendance: attendaceModel);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print("exception in mark attandace service $err");
      return false;
    }
  }
}
