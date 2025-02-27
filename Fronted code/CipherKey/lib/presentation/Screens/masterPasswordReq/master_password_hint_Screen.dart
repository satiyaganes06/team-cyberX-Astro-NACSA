import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lottie/lottie.dart';
import 'package:cipherkey/utils/colors.dart' as colors;
import 'package:cipherkey/utils/constants.dart' as constants;
import 'package:cipherkey/utils/dimensions.dart' as dimens;
import '../../../controller/master_password_hint_controller.getx.dart';
import '../../widget/space.dart';

class PasswordHintScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final masterHintPassController = Get.put(MasterPassswordHintController());
    return KeyboardDismisser(
      gestures: const [GestureType.onDoubleTap, GestureType.onVerticalDragDown],
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: colors.AppColor.secondaryColor,
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Space(Get.height * 0.1),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 230),
                        child: Lottie.asset(
                            'assets/lottie/forgot_password_animation.json',
                            width: Get.height * 0.3),
                      ),
                      Space(Get.height * 0.05),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 230),
                        child: Text(
                            'Enter e-mail address to receive your master password hint',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: colors.AppColor.accentColor,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2),
                      ),
                      Space(Get.height * 0.05),
                      DelayedDisplay(
                          delay: Duration(
                              milliseconds:
                                  dimens.Dimens.delayAnimationLogInPage),
                          child: SizedBox(
                              width: dimens.Dimens.emailContainerHeightLogIn,
                              child: Form(
                                key: formkey,
                                child: TextFormField(
                                  controller: masterHintPassController
                                      .emailTextController,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: colors.AppColor.primaryColor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: colors.AppColor.lightGrey,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0,
                                          color: colors.AppColor.lightGrey),
                                      borderRadius: BorderRadius.circular(dimens
                                          .Dimens.emailContainerBorderLogIn),
                                    ),
                                    hintText:
                                        constants.Constants.emailFieldLogIn,
                                    hintStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          dimens.Dimens.emailFontSizeLogIn,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: dimens.Dimens
                                            .emailContentHorizontalPaddingLogIn,
                                        vertical: dimens.Dimens
                                            .emailContentVerticalPaddingLogIn),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                      return constants
                                          .Constants.emailFieldErrorLogIn;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ))),
                      Space(Get.height * 0.05),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 230),
                        child: Material(
                            color: colors.AppColor.tertiaryColor,
                            borderRadius: BorderRadius.circular(10),
                            shadowColor: colors.AppColor.shadowColor,
                            elevation: 6.1,
                            child: InkWell(
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    // masterHintPassController
                                    //     .sendHintToEmail(context);
                                    masterHintPassController
                                        .userDetectionFun(context);
                                  }

                                  // loginController.firebaseService.resetPassword(emailField.text.trim(), context);
                                },
                                borderRadius: BorderRadius.circular(10),
                                splashColor: colors.AppColor.splashColor,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 60,
                                  child: Center(
                                      child: Text(
                                    "Submit",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: colors.AppColor.secondaryColor),
                                  )),
                                ))),
                      ),
                    ]))),
      ),
    );
  }
}
