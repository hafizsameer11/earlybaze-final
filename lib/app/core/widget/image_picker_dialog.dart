/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:lottie/lottie.dart';

import '../../export.dart';

class ImagePickerDialog extends StatelessWidget {
  final String action;
  final int recordId;
  final String title;
  final galleryFunction;
  final cameraFunction;
  final Function(dynamic) voidCallback;

  const ImagePickerDialog(
      {Key? key,
      required this.action,
      required this.recordId,
      required this.title,
      required this.galleryFunction,
      required this.cameraFunction,
      required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(margin_5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dialogTitle(),
                _dialogButton(),
              ],
            ).marginAll(margin_20)),
        _cancelButton()
      ],
    ).marginAll(margin_10);
  }

  Widget _dialogTitle() => TextView(
        text: title,
        textStyle: textStyleHeading1().copyWith(fontSize: font_17),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_15);

  _cancelButton() => MaterialButtonWidget(
        onPressed: () {
          Get.back();
        },
        buttonRadius: margin_5,
        buttonColor: Colors.white,
        textColor: Colors.black,
        fontsize: font_20,
        buttonText: strCancel,
      ).paddingSymmetric(vertical: margin_15);

  Widget _dialogButton() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GetInkWell(
            onTap: cameraFunction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lottieFiles/camera.json',
                  height: height_40,
                ),
                TextView(
                  text: strTakeImage,
                  textStyle: textStyleBody1(),
                  textAlign: TextAlign.start,
                ).paddingSymmetric(vertical: margin_12),
              ],
            ),
          ),
          SizedBox(
            width: margin_2,
          ),
          GetInkWell(
            onTap: galleryFunction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lottieFiles/gallery.json',
                  height: height_40,
                ),
                TextView(
                  text: strChooseImage,
                  textStyle: textStyleBody1(),
                  textAlign: TextAlign.start,
                ).paddingSymmetric(vertical: margin_12),
              ],
            ),
          )
        ],
      );
}
