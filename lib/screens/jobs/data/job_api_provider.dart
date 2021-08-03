import 'package:spa_app/core/networking/base_networking.dart';
import 'package:spa_app/core/networking/base_response.dart';
import 'package:spa_app/screens/jobs/data/job_detail.dart';
import 'package:spa_app/screens/jobs/data/job_model.dart';
import 'package:spa_app/utils/shared_pref_util.dart';

class JobApiProvider {
  static const String JobApi = 'auth/';
  static const String JobDetailApi = 'auth/property-detail/';
  static const String JobStartApi = 'auth/start-time/';
  static const String JobStopApi = 'auth/stop-time/';

  Future<JobModel> getJobList(String req) async {
    Map<String, dynamic> responseString = await performNetworkOperation(JobApi+ req, "", API_TYPE.GET);
    JobModel response = JobModel.fromJson(responseString);
    return response;
  }

  Future<JobDetailModel> getJobDetail(String req) async {
    Map<String, dynamic> responseString = await performNetworkOperation(JobDetailApi+ req, "", API_TYPE.GET);
    JobDetailModel response = JobDetailModel.fromJson(responseString);
    return response;
  }

  Future<BaseResponse> startJob(bool startedJob , String jobId) async {
    String req = "";
    if (startedJob) {
      req = JobStopApi + jobId ;
    } else {
      req = JobStartApi + jobId ;
    }
    Map<String, dynamic> responseString = await performNetworkOperation(req, "", API_TYPE.GET);
    BaseResponse response = BaseResponse.fromJson(responseString);
    return response;
  }
}