
import '../user_details/user_details.dart';

class ApiHeader {

  Map<String, String> headers = <String,String> {
    'Content-Type': 'application/json',
    'Authorization': "Bearer ${UserDetails.userToken}"

  };

  Map<String, String> sellerHeader = <String,String> {
    'Content-Type': 'application/json',
     'Authorization': "Bearer ${UserDetails.userToken}"
  };

}

// 'Content-Type': 'application/json',