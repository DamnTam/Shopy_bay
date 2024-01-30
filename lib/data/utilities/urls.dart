class Urls{
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
  static  String sentEmailOtpUrl(String email) => '$_baseUrl/UserLogin/$email';
  static  String verifyOtpUrl(String email, String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static String readProfileUrl='$_baseUrl/ReadProfile';
  static String createProfileUrl='$_baseUrl/CreateProfile';
  static String listProductSliderUrl='$_baseUrl/ListProductSlider';
  static String categoryListUrl='$_baseUrl/CategoryList';
  static String popularProductUrl='$_baseUrl/ListProductByRemark/popular';
  static String specialProductUrl='$_baseUrl/ListProductByRemark/special';
  static String newProductUrl='$_baseUrl/ListProductByRemark/new';
  static String addToCartUrl='$_baseUrl/CreateCartList';
  static String ListProductByCategoryIdUrl(int id)=>'$_baseUrl/ListProductByCategory/$id';
  static String productDetailsByIdUrl(int id)=>'$_baseUrl/ProductDetailsById/$id';
}