// import 'package:dio/dio.dart';

// import 'package:mobile/app/data/provider/api.dart';
// import 'package:pocketbase/pocketbase.dart';

// class VilleService {
//   static Dio dio = Dio();
//   final pb = PocketBase(ApiHelper.pbIp);

//   Future<dynamic> getVille() async {
//     try {
//       dynamic response = await pb
//           .collection(ApiHelper.villeCollectionName)
//           .getFullList(batch: 400);
//       print(
//           "------------------------------ BEGIN ----------------------------------");
//       print("sss response from getParameters :::: $response");
//       print(
//           "---------------------------- END ------------------------------------");
//       return response;
//     } catch (ex) {
//       rethrow;
//     }
//   }

// // ---- ----- ----- --- Dio requete ---- ----- ----- ---------------------
// // -------------------------------------------------------

// }
