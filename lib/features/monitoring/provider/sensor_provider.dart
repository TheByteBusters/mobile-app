import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/networking/mqtt.dart';
import 'package:mqtt_client/mqtt_client.dart';

class SensorNotifier extends StateNotifier<Map<String, String>?> {
  SensorNotifier() : super(null);
  var connected = false;

  void connectProker() async {
    if (connected == false) {
      await MqttNetwork.connect();
      print('done');
      connected = true;
      subscribeToTopic('HeartRate&SPO2');
    }
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
      print(message);
      state = messageToMap(message);
    });
  }

  Map<String, String> messageToMap(String message) {
    int hrStart = message.indexOf(' ') + 1;
    int hrEnd = message.indexOf(',');
    String hrReading = message.substring(hrStart, hrEnd);

    int spoStart = message.indexOf('SPO2') + 5;
    int spoEnd = message.length;
    String spoReading = message.substring(spoStart, spoEnd);

    return {
      'heartRate': hrReading,
      'spo2': spoReading,
    };
  }
}

final sensorProvider =
    StateNotifierProvider<SensorNotifier, Map<String, String>?>(
  (ref) => SensorNotifier(),
);
