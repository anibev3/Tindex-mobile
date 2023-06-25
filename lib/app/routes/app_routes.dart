part of './app_pages.dart';

abstract class Routes {
  // SESSION
  static const INITIAL = '/splash';
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
  static const VALIDATEPHONE = '/validate_phone';
  static const OTP = '/otp';
  static const LOGINOTP = '/login_otp';
  static const IDENTIFICATION = '/identification';
  static const COMPTECREE = '/compte_cree';

  // MAPS
  static const ADRESSELIVRAISONMAP = '/adresse_livraison_map';
  static const ADRESSELIVRAISONSETUP = '/adresse_livraison_setup';

  // HOME
  static const HOME = '/home';
  static const SEARCHHOME = '/search_home';
  static const FAVORISHOME = '/favoris_home';
  static const CHATHOME = '/chat_home';
  static const CATEGORIEHOME = "/categorie_home";
  static const PROFILEHOME = '/profile_home';

  // NOTIFCATIONS
  static const NOTIFICATIONHOME = '/notification_home';

  // RESIDENCES
  static const DETAILRESIDENCE = '/detail_residence';
  static const CREATERESIDENCE = '/create_residence';
  static const MESRESIDENCES = '/mes_residence';
  static const EDITRESIDENCE = '/edit_residence';
  static const NEWNOTE = '/nouvelle_note';

  // COMMANDE
  static const RESERVATION = '/reservation';
  static const MESRESERVATION = '/mesreservation';
  static const MESDEMANDES = '/mesdemandes';

  // PROFIL
  static const UPDATEPROFILE = '/update_profile';
  static const UPDATEADRESSELIVRAISON = '/update_adresselivraison';
  // CHAT
  static const CHATSESSION = '/chat_session';
  static const TEST = '/resr';
}
