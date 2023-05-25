import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NetWorkCheck {

  Future<bool> checkNetworkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
     if (connectivityResult == ConnectivityResult.mobile) {
      // Connected to mobile network
      debugPrint('Connected to mobile network');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // Connected to Wi-Fi network
      debugPrint('Connected to Wi-Fi network');
      return true;
    } 
      return false;
    
  }
}

