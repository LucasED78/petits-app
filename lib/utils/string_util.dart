import 'package:petits_app/app/model/address.dart';

class StringUtil {
  final String str;

  StringUtil({this.str});

  static String buildAddress(Address address) {
    return "${address.city}, ${address.state}, ${address.country}";
  }
}