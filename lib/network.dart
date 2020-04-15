import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  String url;
  Network({this.url});

  Future getData() async {
//    try {
      http.Response response = await http.get(url);
//      print(response.statusCode);
//    }
//  catch(e){
//    print(e);
//  }
    if (response.statusCode == 200) {
      String data = response.body;
      return(jsonDecode(data));
    }
    else
      return null;
  }
}
