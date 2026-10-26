import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ble_device_controller_method_channel.dart';

abstract class BleDeviceControllerPlatform extends PlatformInterface {
  /// Constructs a BleDeviceControllerPlatform.
  BleDeviceControllerPlatform() : super(token: _token);

  static final Object _token = Object();

  static BleDeviceControllerPlatform _instance = MethodChannelBleDeviceController();

  /// The default instance of [BleDeviceControllerPlatform] to use.
  ///
  /// Defaults to [MethodChannelBleDeviceController].
  static BleDeviceControllerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BleDeviceControllerPlatform] when
  /// they register themselves.
  static set instance(BleDeviceControllerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
