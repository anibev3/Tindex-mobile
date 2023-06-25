import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:tindex_mobile/app/modules/session/controller/identification_controller.dart';
import 'package:tindex_mobile/app/routes/app_pages.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';
import 'package:tindex_mobile/app/utils/theme/app_form_style.dart';
import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';
import 'package:tindex_mobile/app/widgets/back_button_widget.dart';

class IdentificationScreen extends StatelessWidget {
  IdentificationController controller = Get.put(IdentificationController());

  IdentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white10,
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: Cst.kxl),
            child: SingleChildScrollView(
                child: SafeArea(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // 1- Welcome Text
                SizedBox(height: 20),
                Text("Bienvenu sur",
                    style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.k4xl)),
                Text("Resifin",
                    style: TextCss.dyncoloredBoldStyle(
                        Colors.blueAccent.shade400, Cst.k5xl)),
                SizedBox(height: 10),
                // 2 - Login text subtitle
                Text("creer votre compte pour beneficier du service",
                    style: TextCss.dyncoloredBoldStyle(
                        Colors.blueGrey.shade300, Cst.klg)),

                //  ------------------------------ FORM ------------------------------

                SizedBox(height: 25),
                FormBuilder(
                    key: controller.formIdentificationeKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  ------------------------------ nom & prenom ------------------------------
                        Text("Nom complet",
                            style: TextCss.dyncoloredBoldStyle(
                                Colors.black, Cst.kbase)),
                        SizedBox(height: 10),

                        ///Textfield Noms prenoms
                        FormBuilderTextField(
                          style: TextCss.normalStyle,
                          name: 'noms',
                          validator: (value) {
                            if (value == null) return "Le nom est obligatoire";
                          },
                          decoration: FormCss.defaultInputStyle(
                              " ", "Entrer votre nom"),
                        ),

                        //  ------------------------------ contact ------------------------------
                        SizedBox(height: 22),
                        Text("Contact",
                            style: TextCss.dyncoloredBoldStyle(
                                Colors.black, Cst.kbase)),
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
                                  border: Border.all(
                                      color: Colors.blueGrey.shade100,
                                      width: 2)),
                              child: Center(
                                child: Text("+ 225",
                                    style: TextCss.dyncoloredBoldStyle(
                                        Colors.black, Cst.kbase)),
                              ),
                            ),
                            Container(
                              width: Get.width * 0.7,
                              child: FormBuilderTextField(
                                style: TextCss.normalStyle,
                                name: 'contact',
                                validator: (value) {
                                  if (value == null)
                                    return "Le contact est obligatoire";
                                },
                                decoration: FormCss.defaultInputStyle(
                                    " ", "Entrer votre numero"),
                              ),
                            ),
                          ],
                        ),

                        //  ------------------------------ email ------------------------------
                        SizedBox(height: 22),

                        Text("Email",
                            style: TextCss.dyncoloredBoldStyle(
                                Colors.black, Cst.kbase)),
                        SizedBox(height: 10),

                        ///Textfield Noms prenoms
                        FormBuilderTextField(
                          style: TextCss.normalStyle,
                          name: 'email',
                          validator: (value) {
                            if (value == null) return "L'email est obligatoire";
                          },
                          decoration: FormCss.defaultInputStyle(
                              " ", "Entrer votre adresse"),
                        ),

                        //  ------------------------------ password ------------------------------
                        SizedBox(height: 22),
                        Text("Mot de passe",
                            style: TextCss.dyncoloredBoldStyle(
                                Colors.black, Cst.kbase)),
                        SizedBox(height: 10),

                        ///Textfield Noms prenoms
                        FormBuilderTextField(
                          style: TextCss.normalStyle,
                          name: 'password',
                          obscureText: true,
                          validator: (value) {
                            if (value == null)
                              return "Le mot de passe est obligatoire";
                          },
                          decoration: FormCss.defaultInputStyle(
                              " ", "Entrer votre mot de passe"),
                        ),
                        SizedBox(height: 10),
                        FormBuilderCheckbox(
                          name: 'checkme',
                          decoration: FormCss.transparentInputStyle(),
                          validator: (value) {
                            if (value == null || !value)
                              return "Vous devez donner votre accord";
                          },
                          title: const Text(
                              "En cliquant , vous acceptez les conditions d'utilisation de la plateforme"),
                          // decoration: GlobalCss.defaultInputStyle("Mot de passe", ""),
                        ),
                      ],
                    )),
                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  width: Get.width,
                  child: Obx(() => BlackbuttonWidget(
                      isloading: controller.issubmitLoading.value,
                      text: "S'inscrire",
                      onTap: () {
                        // controller.submit();
                        print(
                            "+++++++++++++++++++++++++++===============================================> S'INSCRIRE A ETE CLIQUé");
                      })),
                ),
                SizedBox(height: 10),
                Divider(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Avez vous déja un compte ?",
                      style: TextCss.dyncoloredNormalStyle(
                          Colors.grey.shade700, Cst.kbase),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Text(
                          "Connectez-vous",
                          style: TextCss.dyncoloredBoldStyle(
                              Colors.blueAccent.shade400, Cst.kbase),
                        ))
                  ],
                )
              ],
            )))));
  }
}
