import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:walktron/controllers/controllers.dart';
import 'package:walktron/widgets/widgets.dart';

class AddDevicesView extends StatefulWidget {
  @override
  _AddDevicesViewState createState() => _AddDevicesViewState();
}

class _AddDevicesViewState extends State<AddDevicesView>
    with SingleTickerProviderStateMixin {
  final BluetoothController _bluetoothController = Get.find();
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              InkWell(
                onDoubleTap: () => _controller.reset(),
                child: SafeArea(
                  child: CustomPaint(
                    painter: SpritePainter(_controller),
                    child: const SizedBox(
                      height: 400,
                      width: 400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 300,
            child: Obx(
              () => ListView(
                children: List.generate(
                  _bluetoothController.devicesList.length,
                  (index) {
                    final BluetoothDevice device = _bluetoothController
                        .devicesList[index] as BluetoothDevice;
                    return ListTile(
                      title: Text(device.name),
                      subtitle: Text(
                        _bluetoothController.isButtonUnavailable.value
                            .toString(),
                      ),
                      trailing: IconButton(
                        icon: const FaIcon(FontAwesomeIcons.megaport),
                        onPressed: () =>
                            !_bluetoothController.isButtonUnavailable.value
                                ? _bluetoothController.connect(device)
                                : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
