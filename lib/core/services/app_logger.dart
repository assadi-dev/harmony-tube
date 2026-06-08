import 'package:harmony_tube/injections/injector.dart';
import 'package:logger/logger.dart';

Logger get appLogger => injector<Logger>();
