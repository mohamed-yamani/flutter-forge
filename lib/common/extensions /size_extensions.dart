import 'package:flutterforge/common/screenutil/screenutil.dart';

extension SizeExtensions on num {
  // this extension is used to convert the number to the screen width
  double get w => ScreenUtil().setWidth(this);

  // this extension is used to convert the number to the screen height
  double get h => ScreenUtil().setHeight(this);

  // this extension is used to convert the number to the screen sp (scalable pixels)
  double get sp => ScreenUtil().setSp(this);
}
