
class APIConstant
{

  static String base_url = 'http://adslay.arjunweb.in/API/';

  static String home = base_url + 'HomeAPI/HomeScreenAPI';

  static String categoryBaseStoresList = base_url + 'StoresAPI/StoresList';

  static String getStoreDetails = base_url + 'StoresAPI/StoreDetails';

  static String getSelectedStoreCartDetails = base_url + 'StoresAPI/CustomerStoreCartDetailsAPI';

  static String getStorePackage = base_url + 'StoresAPI/StorePackagesAmount';

  static String login = base_url + 'AccountAPI/LogonPhno';
  
  static String signup = base_url + 'AccountAPI/Signup';

  static String getPackageDetails = base_url + 'StoresAPI/StorePackagesDetailsAPI';

  static String getCartItems = base_url + 'StoresAPI/GetCustomerCartListAPI';

  static String getCartHistoryItems = base_url + 'OrderAPI/OrdersListAPI';

  static String insCartItems = base_url + 'StoresAPI/InsertCustomerCart';

  static String deleteCartItem = base_url + 'StoresAPI/CartRemoveAPI';

  static String getUploadedImagesList = base_url + 'StoresAPI/GetCustomerBookImagesListAPI';

  static String removeUploadedImagesFromList = base_url + 'StoresAPI/RemoveCustomerBookImage';

  static String postProfilePicToServer = base_url + 'AccountAPI/PostCustomerImage';

  static String postProfilePicDetailsToServer = base_url + 'AccountAPI/UpdateCustomerProfileImageAPI';

  static String updateProfileDetails = base_url + '/AccountAPI/ProfileUpdate';

  static String autoSearchADSpaces = base_url + 'StoresAPI/StoresSearchAutoComplete';

  static String completeBooking = base_url + 'OrderAPI/OrderInsertAPI';

  static String getCompletedOrderDetails = base_url + 'OrderAPI/OrderDetailsGetAPI';



}
