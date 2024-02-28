class ApiCode {
  static const int kCodeSuccess = 200;
  static const int kCodeParamError = 400;
  static const int kCodeServerError = 500;

  static const int kCodeTokenInvalid = 102002001; // token没传，需要验证token的接口
  static const int kCodeTokenExpired = 102002002; // token过期
}
