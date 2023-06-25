import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PbExceptions {
  final String message404;
  final String message400;

  PbExceptions(
      {this.message404 = "Pas trouvé",
      this.message400 = "Plusieurs champs sont incorrects"});

  checkError(dynamic err) async {
    print("Error : $err ");
    if (err.isAbort) {
      // pas de connexion
      await Flushbar(
        backgroundColor: Colors.blueAccent,
        title: "Problème de connexion internet",
        margin: EdgeInsets.only(top: 50),
        message: 'Verifiez votre connexion à internet',
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
      ).show(Get.context!);
      return;
    } else {
      // pas de connexion
      if (err.statusCode == 404) {
        await Flushbar(
          backgroundColor: Colors.blueGrey.shade400,
          title: "Aucune donnée trouvé",
          message: message404,
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.BOTTOM,
        ).show(Get.context!);
        return;
      }

      if (err.statusCode == 400) {
        await Flushbar(
          backgroundColor: Colors.blueGrey.shade400,
          title: "Echec de la requête",
          message:
              "${err.response["data"].isEmpty ? message400 : err.response["data"]}",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.BOTTOM,
        ).show(Get.context!);
        return;
      }
      await Flushbar(
        backgroundColor: Colors.blueGrey.shade400,
        title: "Erreur interne de l'application",
        message: "Veuillez reessayer plus tard",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
      ).show(Get.context!);
      return;
    }
  }
}
