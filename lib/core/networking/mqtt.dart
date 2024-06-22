import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

final client = MqttServerClient("broker.hivemq.com", '1883');

class MqttNetwork {
  static bool isConnected = false;
  static Future<void> connect() async {
    print('enter function');
    client.logging(on: true);
    client.onDisconnected = _onDisconnected;
    client.onConnected = _onConnected;
    client.pongCallback = _pong;

    final connMess = MqttConnectMessage()
        .withClientIdentifier('ziadz')
        .withWillTopic('HeartRate&SPO2')
        .withWillMessage('flutter message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    print('connect message: ${connMess.payload}');

    print('client connecting');
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      print('====================================================');
      print('client exception - $e');
      print('====================================================');
      client.disconnect();
    } on SocketException catch (e) {
      print('====================================================');
      print('socket exception - $e');
      print('====================================================');
      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('====================================================');
      isConnected = true;
      print('client connected');
      print('====================================================');
    } else {
      print('====================================================');
      print(
          'client connection failed - disconnecting, status is ${client.connectionStatus}');
      print('====================================================');
      client.disconnect();
      print('====================================================');
      throw Exception('client connection failed ${client.connectionStatus}');
    }
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
    } else {
      print('Disconnection was unexpected, trying to reconnect');
      _reconnect();
    }
  }

  static void _onConnected() {
    print('OnConnected client callback - Client connection was sucessful');
  }

  static void _pong() {
    print('Ping response client callback invoked');
  }

  static void _reconnect() async {
    const int maxRetryAttempts = 5;
    int retryCount = 0;

    while (!isConnected && retryCount < maxRetryAttempts) {
      retryCount++;
      print('Reconnecting attempt $retryCount');
      await Future.delayed(const Duration(seconds: 5));
      try {
        await connect();
      } catch (e) {
        print('Reconnect attempt $retryCount failed: $e');
      }
    }

    if (isConnected) {
      print('Reconnected successfully');
    } else {
      print('Failed to reconnect after $maxRetryAttempts attempts');
    }
  }
}
