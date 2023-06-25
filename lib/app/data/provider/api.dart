class ApiHelper {
  // Online
  // static String _pbIp = "http://161.97.116.248:8092";
  // static String _nodeIp = "http://161.97.116.248:8094";
// Localhost
  static String pbIp = "http://10.0.2.2:8092";
  static String nodeIp = "http://10.0.2.2:8094/api/v1";

  // -------------  API -------------------------
  // --  -- -- -- -- User Api -- -- --
  static String userApi = "$nodeIp/users";
  static String userApiConfirmNumber = "$userApi/users";
  static String userApiUpdateProfile = "$userApi/update-profile";
  // ----- -- -- user api

  // --  -- -- -- -- Auth Api -- -- --
  static String authApi = "$nodeIp/auth";
  static String authApiConfirmNumber = "$authApi/validatenumber";
  static String authApiResendOtp = "$authApi/otp-renew";
  static String authApiLoginWithNumber = "$authApi/login-number";
  // ----- -- -- auth api

  // --  -- -- -- -- Favoris Api -- -- --
  static String favorisApi = "$nodeIp/favoris";
  static String favorisApiSet = "$favorisApi/setfavoris";

  // --  -- -- -- -- Residence Api -- -- --
  static String residenceApi = "$nodeIp/residences";
  static String residenceApiFindPlaces = "$residenceApi/getplaces";
  static String residenceApiPost = "$residenceApi/add";

  // --  -- -- -- -- Demande Api -- -- --
  static String demandeApi = "$nodeIp/reservation";
  static String demandeConfirm = "$demandeApi/confirmreservation";

  // ----- -- -- auth api

  // -------------  COLLECTION -------------------------

  // ----- -- -- user collection
  static const userCollectionName = "users";
  // ----- -- -- demande collection
  static const demandeCollectionName = "demandes";
  // ----- -- -- residence type collection
  static const residenceTypeCollectionName = "residence_type";
  // ----- -- -- residence collection
  static const residenceCollectionName = "residences";
  // ----- -- -- note collection
  static const noteCollectionName = "note";
  // ----- -- -- notifications collection
  static const notificationCollectionName = "notifications";
  // ----- -- -- boite de reception collection
  static const receptionCollectionName = "receptionbay";
  // ----- -- -- favoris collection
  static const favorisCollectionName = "favoris";
  // ----- -- -- parametres collection
  static const parametresCollectionName = "parametres";
  // ----- -- -- ville collection
  // static const villeCollectionName = "ville";
  // ----- -- -- conversation collection
  static const conversationCollectionName = "conversation";
}
