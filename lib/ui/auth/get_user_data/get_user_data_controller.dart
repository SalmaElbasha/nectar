import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user_profile_model.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class GetUserDataController extends GetxController{
  Data? user;
  static String? userPhoto;
  bool isLoading=true;
  @override
  void onInit()async {

    super.onInit();
    await CacheHelper.init();
    await getUserProfile();
  }



  Future<void> getUserProfile()async{
    isLoading=true;
    update();
   String?id=await Get.find<CacheHelper>().getDataString(key: "id");
    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/nectar/get/$id"
      );
      if(response.statusCode==200){
        UserProfileModel r = UserProfileModel.fromJson(response.data);
        if(r.message=="success"){
          user=r.data;
          userPhoto=user?.photoPath;
          isLoading=false;
        }else{
        }
      }
    }catch(e){}
finally{
      isLoading=false;
      update();
      print(user);
}
}
}