import 'dart:convert';
import 'package:a/models/loginModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class LoginController extends GetxController{
  var token = ''.obs;



  login(email,password)async{
    var url = 'http://103.186.185.77:5017/v1/app/customer/customerappsignin';
    var response = await http.post(Uri.parse(url), body: {'email': email, 'password': password});

    if(response.statusCode==200){
      return json.decode(response.body);
    }else if(response.statusCode==400){
      Get.snackbar('', 'Invalid user or data');
    }else{
      print('frgeewrgerg');
      return Exception('something went wrong');
    }
  }
}