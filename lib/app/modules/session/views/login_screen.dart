import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:tindex_mobile/app/modules/session/controller/login_controller.dart';
import 'package:tindex_mobile/app/modules/session/widgets/login_mod_button_widget.dart';

import 'package:tindex_mobile/app/utils/theme/Constant.dart';
import 'package:tindex_mobile/app/utils/theme/app_form_style.dart';
import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';
import 'package:tindex_mobile/app/widgets/back_button_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: Cst.kxl),
            child: SafeArea(
                child: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // 1- Welcome Text
                    const SizedBox(height: 20),
                    Text("Connectez vous",
                        style: TextCss.dyncoloredBoldStyle(
                            Colors.black, Cst.k4xl)),
                    Text("Resifin",
                        style: TextCss.dyncoloredBoldStyle(
                            Colors.blueAccent.shade400, Cst.k5xl)),
                    SizedBox(height: 10),
                    // 2 - Login text subtitle
                    Text(
                        "connectez vous et trouvez des residences autour de vous",
                        style: TextCss.dyncoloredBoldStyle(
                            Colors.blueGrey.shade300, Cst.klg)),

                    // Barre de choix du mode de connexion
                    SizedBox(height: 30),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(
                            () => LoginModButton(
                              text: "Email + Mot de passe",
                              isactive: controller.isPassword.value,
                              onTap: () {
                                controller.isPassword(true);
                              },
                            ),
                          ),
                          Obx(
                            () => LoginModButton(
                              text: "Contact + OTP",
                              isactive: !controller.isPassword.value,
                              onTap: () {
                                controller.isPassword(false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //-------------------  build Screens
                    const SizedBox(height: 30),
                    buildScreens(),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  width: Get.width * 0.89,
                  child: BlackbuttonWidget(
                      isloading: controller.issubmitLoading.value,
                      text: "Login",
                      onTap: () {
                        controller.submit();
                      }),
                ),
              )
            ]))));
  }

  Widget buildScreens() {
    return FormBuilder(
      key: controller.formLoginKey,
      child: Column(
        children: [
          Obx(() => Visibility(
              visible: controller.isPassword.value,
              child: buildEmailpasswordScreen())),
          Obx(() => Visibility(
              visible: !controller.isPassword.value,
              child: buildContactScreen())),
        ],
      ),
    );
  }

  Widget buildEmailpasswordScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  ------------------------------ email ------------------------------

        Text("Email",
            style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.kbase)),
        SizedBox(height: 10),

        ///Textfield Noms prenoms
        FormBuilderTextField(
          style: TextCss.normalStyle,
          name: 'email',
          validator: (value) {
            if (value == null) return "L'email est obligatoire";
          },
          decoration: FormCss.defaultInputStyle(" ", "Entrer votre adresse"),
        ),

        //  ------------------------------ password ------------------------------
        SizedBox(height: 22),
        Text("Mot de passe",
            style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.kbase)),
        SizedBox(height: 10),

        ///Textfield Noms prenoms
        FormBuilderTextField(
          style: TextCss.normalStyle,
          name: 'password',
          obscureText: true,
          validator: (value) {
            if (value == null) return "Le mot de passe est obligatoire";
          },
          decoration:
              FormCss.defaultInputStyle(" ", "Entrer votre mot de passe"),
        ),
      ],
    );
  }

  Widget buildContactScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  ------------------------------ contact ------------------------------
        SizedBox(height: 22),
        Text("Contact",
            style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.kbase)),
        SizedBox(height: 10),

        ///Textfield Noms prenoms
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: Get.width * 0.18,
              height: 46,
              decoration: GlobalCss.containerStyleWithoutShadow(
                  Colors.grey.shade50,
                  rad: Cst.kDefaultRaduis,
                  border:
                      Border.all(color: Colors.blueGrey.shade100, width: 2)),
              child: Center(
                child: Text("+ 225",
                    style:
                        TextCss.dyncoloredBoldStyle(Colors.black, Cst.kbase)),
              ),
            ),
            Container(
              width: Get.width * 0.7,
              child: FormBuilderTextField(
                style: TextCss.normalStyle,
                name: 'contact',
                validator: (value) {
                  if (value == null) return "Le contact est obligatoire";
                },
                decoration:
                    FormCss.defaultInputStyle(" ", "Entrer votre numero"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
