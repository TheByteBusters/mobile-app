import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/networking/mqtt.dart';
import 'package:mqtt_client/mqtt_client.dart';

class SensorNotifier extends StateNotifier<String> {
  SensorNotifier() : super('0');
  var connected = false;

  void connectProker() async {
    MqttNetwork.connect();
    subscribeToTopic('heartRateTopic');
    connected = true;
  }

  void subscribeToTopic(String topicName) {
    print('Subscribing to the $topicName topic');
    client.subscribe(topicName, MqttQos.atMostOnce);

    // print the message when it is received
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      var message =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print('YOU GOT A NEW MESSAGE:');
      state = message;
    });
  }
}

final sensorProvider = StateNotifierProvider<SensorNotifier, String>(
  (ref) => SensorNotifier(),
);
