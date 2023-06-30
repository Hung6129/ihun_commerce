import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfor({
  required String text,
}) {
  return Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 2,
    gravity: ToastGravity.TOP,
    fontSize: 16.sp,
  );
}
