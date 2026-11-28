//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:mobile/features/pages/splash_screen.dart';

//import 'core/api_config.dart';

void main() {
//DevicePreview.enable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen());
  }
}

// class PingScreen extends StatefulWidget {
//   const PingScreen({super.key});

//   @override
//   State<PingScreen> createState() => _PingScreenState();
// }

// class _PingScreenState extends State<PingScreen> {
//   String result = 'اضغط الزر لاختبار الاتصال';

//   Future<void> testConnection() async {
//     try {
//       final dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl));
//       final res = await dio.get('/ping');
//       setState(() => result = '✅ ${res.data}');
//     } catch (e) {
//       setState(() => result = '❌ $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Connection Test')),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(result, textAlign: TextAlign.center),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: testConnection,
//               child: const Text('Test API'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
