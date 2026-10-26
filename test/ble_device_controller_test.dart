import 'package:flutter_test/flutter_test.dart';
import 'package:ble_device_controller/ble_device_controller.dart';
import 'package:ble_device_controller/ble_device_controller_platform_interface.dart';
import 'package:ble_device_controller/ble_device_controller_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBleDeviceControllerPlatform
    with MockPlatformInterfaceMixin
    implements BleDeviceControllerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BleDeviceControllerPlatform initialPlatform = BleDeviceControllerPlatform.instance;

  test('$MethodChannelBleDeviceController is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBleDeviceController>());
  });

  test('getPlatformVersion', () async {
    BleDeviceController bleDeviceControllerPlugin = BleDeviceController();
    MockBleDeviceControllerPlatform fakePlatform = MockBleDeviceControllerPlatform();
    BleDeviceControllerPlatform.instance = fakePlatform;

    expect(await bleDeviceControllerPlugin.getPlatformVersion(), '42');
  });
}
