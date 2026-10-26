
import 'ble_device_controller_platform_interface.dart';

class BleDeviceController {
  Future<String?> getPlatformVersion() {
    return BleDeviceControllerPlatform.instance.getPlatformVersion();
  }
}
