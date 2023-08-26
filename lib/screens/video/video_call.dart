import 'package:flutter/material.dart';
import 'package:sendbird_calls/sendbird_calls.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class VideoCallScreen extends StatefulWidget {
  final User remoteUser;

  VideoCallScreen({required this.remoteUser});

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late final SendbirdCall _sendbirdCall;
  late final Call _call;

  @override
  void initState() {
    super.initState();
    _sendbirdCall = SendbirdCall();
    _call = _sendbirdCall.createCall(
      callHandler: CallHandler(
        onEstablished: () {
          // Called when the call is established
        },
        onConnected: () {
          // Called when the call is connected
        },
        onEnded: (callEnd) {
          // Called when the call ends
        },
      ),
    );
    _call.startVideoCall(widget.remoteUser.userId);
  }

  @override
  void dispose() {
    _sendbirdCall.endCall(_call);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Call'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calling ${widget.remoteUser.nickname}...'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _sendbirdCall.endCall(_call);
                Navigator.of(context).pop();
              },
              child: Text('End Call'),
            ),
          ],
        ),
      ),
    );
  }
}
