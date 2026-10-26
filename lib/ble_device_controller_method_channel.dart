import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ble_device_controller_platform_interface.dart';

/// An implementation of [BleDeviceControllerPlatform] that uses method channels.
class MethodChannelBleDeviceController extends BleDeviceControllerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ble_device_controller');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
