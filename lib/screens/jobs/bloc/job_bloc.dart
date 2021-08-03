import 'dart:convert';

import 'package:spa_app/core/networking/base_response.dart';
import 'package:spa_app/screens/jobs/data/job_api_provider.dart';
import 'package:spa_app/screens/jobs/data/job_detail.dart';
import 'package:spa_app/screens/jobs/data/job_model.dart';
import 'package:spa_app/screens/login/data/login_model.dart';
class JobBloc {
  JobApiProvider jobApiProvider = JobApiProvider();
  Future<JobModel> getJobList(String type) async {
    String reqBody = type;
    JobModel response = await jobApiProvider.getJobList(reqBody);
    return response;
  }

  Future<JobDetailModel> getJobDetail(String type) async {
    String reqBody = type;
    JobDetailModel response = await jobApiProvider.getJobDetail(reqBody);
    return response;
  }

  Future<BaseResponse> startJob(bool startJob , String jobId) async {
    BaseResponse response = await jobApiProvider.startJob(startJob ,jobId );
    return  response;
  }
}