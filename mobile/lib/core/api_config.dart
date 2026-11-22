import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConfig {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:8000/api'; // المتصفح (أنت)
    }
    return 'http://10.0.2.2:8000/api'; // محاكي أندرويد (فريق الفرونت)
  }
}
