import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/conversation.model.dart';
import 'package:tindex_mobile/app/data/page_models/conversation_page_model.dart';
import 'package:tindex_mobile/app/data/provider/api.dart';

class ConversationService {
  static Dio dio = Dio();
  final pb = PocketBase(ApiHelper.pbIp);

  Future<dynamic> getCommentOnResidence(String residenceID) async {
    try {
      dynamic response =
          await pb.collection(ApiHelper.noteCollectionName).getFullList(
                batch: 200,
                sort: '-created',
                expand: 'residence, user',
                filter: 'residence = "$residenceID" ',
              );
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> getConversation(ConversationPageModel items) async {
    try {
      dynamic response = await pb
          .collection(ApiHelper.conversationCollectionName)
          .getFirstListItem(
            '(acteur1 = "${items.ownerID}" && acteur2 = "${items.senderID}" )  || ( acteur1 = "${items.senderID}" && acteur2 = "${items.ownerID}" ) ',
            expand: 'residence, user',
          );
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> updateChat(Conversation co) async {
    print("items =========== to send");
    print(co.toJson());
    try {
      dynamic response = await pb
          .collection(ApiHelper.conversationCollectionName)
          .update(co.id!, body: co.toMap());
      return response;
    } catch (ex) {
      rethrow;
    }
  }

// ---- ----- ----- --- Dio requete ---- ----- ----- ---------------------
// -------------------------------------------------------
}
