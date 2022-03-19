class AppConfigs {
  static const String appName = 'Flutter Boilerplate';

  ///API URL
  static const baseUrl = "http://202.157.184.201:8000";

  ///Paging
  static const pageSize = 10;
  static const pageSizeMax = 100;

  ///DateFormat
  static const dateApiFormat = 'yyyy-MM-dd';
  static const dateDisplyaFormat = 'dd MMM yyyy';

  static const dateTimeApiFormat = "MM/dd/yyyy'T'hh:mm:ss.SSSZ";
  static const dateTimeDisplayFormat = 'dd/MM/yyyy HH:mm';

  ///Date range
  static final identityMinDate = DateTime(1900, 1, 1);
  static final identityMaxDate = DateTime.now();
  static final birthMinDate = DateTime(1900, 1, 1);
  static final birthMaxDate = DateTime.now();

  ///Font
  static const fontFamily = 'Roboto';
}
