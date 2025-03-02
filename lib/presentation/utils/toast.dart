

import 'package:fluttertoast/fluttertoast.dart';

import '../view/style/style.dart';


successToast(){
  return Fluttertoast.showToast(
      msg: "Request Success",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}
errorToast(){
  return Fluttertoast.showToast(
      msg: "Request Fail",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );
}