import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

final client = MqttServerClient("broker.hivemq.com", '8883');

class MqttNetwork {
  static Future<void> connect() async {
    client.logging(on: true);
    client.onDisconnected = _onDisconnected;
    client.onConnected = _onConnected;
    client.pongCallback = _pong;

    final connMess = MqttConnectMessage()
        .withClientIdentifier('zezoo')
        .withWillTopic('heartRateTopic')
        .withWillMessage('flutter message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    print('client connecting');
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      print('client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      print('socket exception - $e');
      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('client connected');
    } else {
      print(
          'client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      throw Exception('client connection failed ${client.connectionStatus}');
    }
    // subscribeToTopic('heartRateTopic');
  }

  static void subscribeToTopic(String topicName) {
    print('Subscribing to the $topicName topic');
    client.subscribe(topicName, MqttQos.atMostOnce);

    // print the message when it is received
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      var message =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print('YOU GOT A NEW MESSAGE:');
      print(message);
    });
  }

  static void _onDisconnected() {
    print('OnDisconnected client callback - Client diconnected');
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      print('OnDisconnected callback is solicitd, this is correct');
    }
    throw Exception('diconnected');
  }

  static void _onConnected() {
    print('OnConnected client callback - Client connection was sucessful');
  }

  static void _pong() {
    print('Ping response client callback invoked');
  }
}
