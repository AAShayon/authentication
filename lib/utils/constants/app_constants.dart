


class AppConstants {
  static const String APP_NAME = 'ParcelStar Rider';
  static const String APP_VERSION = '1.0.0';
  static const String USER_ID = 'userId';
  static const String NAME = 'name';

  ///Base url
  //static const String BASE_URL = 'http://192.168.0.244:8000';
  static const String BASE_URL = 'http://192.168.0.20:8000';
  //static const String BASE_URL = 'https://parcelstar.excelitaiportfolio.com';
  // static const String BASE_URL = 'https://parcelstar.com.bd';


  ///Rider Api
  static const String LOGIN_URI = '/api/login';
  static const String LOGOUT_URI = '/api/rider/logout';
  static const String PROFILE_URI = '/api/rider/profile';
  static const String FORGET_PASSWORD_URI = '/api/rider/forgotPassword?number=';
  static const String PARCEL_PICKUP_URI = '/api/rider/parcelPickup';
  static const String PARCEL_DELIVERY_URI = '/api/rider/parcelDelivery?';
  static const String TOTAL_COLLECTED_AMOUNT = '/api/rider/totalCollectedAmount?';
  static const String DELIVERY_PARCEL_LIST_URI = '/api/rider/getDeliveryParcelList?';
  static const String CANCEL_PARCEL_LIST_URI = '/api/rider/getReturnParcelList?';
  static const String HUB_RECEIVED_URI = '/api/rider/getHubReceiveList?';
  static const String TODAY_PICKUP_DONE = '/api/rider/todayPickupDoneParcelList';
  static const String TODAY_PICKUP_REJECT = '/api/rider/todayPickupRejectlList';
  static const String TOTAL_PICKUP_DONE = '/api/rider/totalPickupDoneParcelList?';
  static const String TOTAL_PICKUP_REJECT = '/api/rider/totalPickupRejectlList?';
  static const String COLLECTED_LIST = '/api/rider/collectedAmountParcelList?';
  static const String HUB_RECEIVED_PARCEL_LIST_URI = '/api/rider/hubReceivedParcelList?';
  static const String DELIVERY_CANCEL_PARCEL_URI = '/api/rider/cancelParcelList';
  static const String PENDING_PARCEL_AMOUNT_LIST_URI = '/api/rider/pendingParcelAmountList?';
  static const String TODAY_PICKUP_REQUEST_LIST = '/api/rider/todayPickupRequestParcelList';
  static const String TOTAL_PICKUP_REQUEST_LIST = '/api/rider/totalPickupRequestParcelList?';
  static const String PICKUP_PARCEL_LIST_MENUBAR = '/api/rider/pickupParcelList?';
  static const String TODAY_PICKUP_PENDING_LIST = '/api/rider/todayPickupPendingParcelList';
  static const String TOTAL_PICKUP_PENDING_LIST = '/api/rider/totalPickupPendingParcelList?';
  static const String PARCEL_DELIVERY_REQUEST_ACCEPT = '/api/rider/parcelDeliveryRequestAccept?';
  static const String PARCEL_DELIVERY_COMPLETE = '/api/rider/parcelDeliveryComplete?';
  static const String CONFIRM_COMPLETE_REQUEST = '/api/rider/confirmCompletePickupRequest?';
  static const String RESCHEDULE_REQUEST = '/api/rider/parcelPickupReschedule?';
  static const String PICKUP_PARCEL_REJECT = '/api/rider/pickupParcelReject';
  static const String STATEMENT_URI = '/api/rider/getStatement?';
  static const String commissionAmountUrl = '/api/rider/getCommissionAmount';
  static const String getWithdrawCommissionUrl = '/api/rider/getWithdrawCommission';
  static const String sendWithdrawRequestUrl = '/api/rider/sendWithdrawRequest';
  static const String viewWithdrawCommissionListUrl = '/api/rider/viewWithdrawCommissionList';
  static const String viewWithdrawCommissionHistoryUrl = '/api/rider/viewWithdrawCommissionHistory?';
  static const String viewWeightWithdrawCommissionParcelHistoryUrl = '/api/rider/viewWeightWithdrawCommissionParcelHistory?';
  static const String viewQuantityWithdrawCommissionParcelHistoryUrl = '/api/rider/viewQuantityWithdrawCommissionParcelHistory?';




  static const String RESET_PASSWORD_URI = '/api/v1/auth/reset-password';





  // sharePreference
  static const String TOKEN = 'token';
  static const String USER = 'user';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String HOME_ADDRESS = 'home_address';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String OFFICE_ADDRESS = 'office_address';
  static const String CART_LIST = 'cart_list';
  static const String CONFIG = 'config';
  static const String GUEST_MODE = 'guest_mode';
  static const String CURRENCY = 'currency';
  static const String LANG_KEY = 'lang';
  static const String INTRO = 'intro';
  static const String COUNTRY_CODE = 'country_code';
  static const String THEME = 'theme';




}
