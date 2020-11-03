import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  final Rx<BluetoothState> _bluetoothState = BluetoothState.UNKNOWN.obs;
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  BluetoothConnection connection;

  // int _deviceState;

  bool isDisconnecting = false;

  RxString steps = '0'.obs;
  bool get isConnected => connection != null && connection.isConnected;

  final RxList devicesList = [].obs;
  // BluetoothDevice device;
  final RxBool connected = false.obs;
  final RxBool isButtonUnavailable = false.obs;

  @override
  void onInit() {
    _bluetooth.state.then((state) => _bluetoothState.value = state);
// _deviceState = 0; // neutral
    enableBluetooth();
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      _bluetoothState.value = state;
      if (_bluetoothState.value == BluetoothState.STATE_OFF) {
        isButtonUnavailable.value = true;
      }
      getPairedDevices();
    });
    super.onInit();
  }

  @override
  void onClose() {
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }
    super.onClose();
  }

  Future<void> enableBluetooth() async {
    // Retrieving the current Bluetooth state
    _bluetoothState.value = await _bluetooth.state;

    // If the bluetooth is off, then turn it on first
    // and then retrieve the devices that are paired.
    if (_bluetoothState.value == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    // To get the list of paired devices
    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

    // It is an error to call [setState] unless [mounted] is true.
    // if (!mounted) {
    //   return;
    // }

    // Store the [devices] list in the [_devicesList] for accessing
    // the list outside this class

    devicesList.value = devices;
  }

  Future<void> connect(BluetoothDevice device) async {
    isButtonUnavailable.value = true;
    if (device == null) {
      print('no device is selected');
    } else {
      if (!isConnected) {
        await BluetoothConnection.toAddress(device.address).then((_connection) {
          print('Connected to the device');
          connection = _connection;
          connected.value = true;
          connection.input.listen((Uint8List data) {
            print('Data incoming: ${ascii.decode(data)}');
            // print('Data incomingUTF: ${utf8.decode(data)}');

            // steps.value = int.tryParse(
            //       ascii.decode(data),
            //     ) ??
            //     120;
            steps.value = ascii.decode(data);
            print("steps ${steps.value}");
            // connection.output.add(data); // Sending data
            // connection.output.add(utf8.encode('0'));
            if (ascii.decode(data).contains('!')) {
              connection.finish(); // Closing connection
              print('Disconnecting by local host');
            }
          }).onDone(() {
            if (isDisconnecting) {
              print('Disconnecting locally!');
            } else {
              print('Disconnected remotely!');
            }
          });
        }).catchError((error) {
          print('Cannot connect, exception occurred');
          print(error);
        });

        isButtonUnavailable.value = false;
      }
    }
  }

  Future<void> disconnect() async {
    isButtonUnavailable.value = true;
    // _deviceState = 0;

    await connection.close();
    // show('Device disconnected');
    if (!connection.isConnected) {
      connected.value = false;
      isButtonUnavailable.value = false;
    }
  }

  Future<void> sendMessageToBluetooth(String data) async {
    connection.output.add(utf8.encode("$data\r\n") as Uint8List);
    // connection.output.add(utf8.encode("0" + "\r\n") as Uint8List);
    await connection.output.allSent;
  }
}
