import 'package:core/network/api/api_configuration.dart';
import 'package:core/network/api/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

// class CoreModule extends Module {
//   @override
//   List<Bind> get binds => [
//         Bind.lazySingleton<Dio>((i) => i<DioClient>().dio),
        
//         Bind.lazySingleton<DioClient>(
//             (i) => DioClient(configuration: ApiConfiguration())),
//       ];
// }
