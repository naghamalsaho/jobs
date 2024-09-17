import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Chat UI'),
        ),
        body: Column(
          children: [
            ChatMessageTile(
              message: "مرحباً، كيف حالك اليوم؟",
              time: "12:45 PM",
              isSentByMe: true,
            ),
            ChatMessageTile(
              message: "مرحباً، كيف حالك اليوم؟",
              time: "12:45 PM",
              isSentByMe: false,
            ),
            ChatMessageTile(
              message: "مرحباً، كيف حالك اليوم؟",
              time: "12:45 PM",
              isSentByMe: true,
            ),
            ChatMessageTile(
              message: "مرحباً، كيف حالك اليوم؟",
              time: "12:45 PM",
              isSentByMe: true,
            ),
            ChatMessageTile(
              message: "مرحباً، كيف حالك اليوم؟",
              time: "12:45 PM",
              isSentByMe: true,
            ),
            FrostedGlassBubble(
              message: 'hhhhhhhhh',
            )
          ],
        ),
      ),
    );
  }
}

class ChatMessageTile extends StatelessWidget {
  final String message;
  final String time;
  final bool isSentByMe;

  ChatMessageTile({
    required this.message,
    required this.time,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20.0);
    return Row(
      mainAxisAlignment:
          isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          // constraints: BoxConstraints(
          //   maxWidth: MediaQuery.of(context).size.width * 0.6,
          // ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSentByMe
                  ? [AppColor.praimaryColor, Colors.blue.shade100]
                  : [AppColor.grey, Colors.grey.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
            borderRadius: isSentByMe
                ? borderRadius.subtract(
                    const BorderRadius.only(bottomRight: Radius.circular(20)))
                : borderRadius.subtract(
                    const BorderRadius.only(bottomLeft: Radius.circular(20))),
          ),
          child: Column(
            crossAxisAlignment:
                isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: isSentByMe ? Colors.white : Colors.black87,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: TextStyle(
                  color: isSentByMe ? Colors.white70 : Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class MyAppp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text('Chat UI'),
//         ),
//         body: ListView(
//           children: [
//             ChatMessageTile(
//               message: "مرحباً، كيف حالك اليوم؟ 😊",
//               time: DateFormat('hh:mm a').format(DateTime.now()),
//               isSentByMe: true,
//             ),
//             ChatMessageTile(
//               message: "أنا بخير، شكراً لسؤالك! 🌟",
//               time: DateFormat('hh:mm a').format(DateTime.now()),
//               isSentByMe: false,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ChatMessageTile extends StatelessWidget {
//   final String message;
//   final String time;
//   final bool isSentByMe;

//   ChatMessageTile({
//     required this.message,
//     required this.time,
//     required this.isSentByMe,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment:
//             isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: [
//           if (!isSentByMe)
//             CircleAvatar(
//               backgroundColor: Colors.grey.shade300,
//               child: Text('أ'),
//             ),
//           SizedBox(width: isSentByMe ? 0 : 8),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//             decoration: BoxDecoration(
//               color: isSentByMe ? Colors.blue : Colors.grey[300],
//               borderRadius: isSentByMe
//                   ? BorderRadius.only(
//                       topLeft: Radius.circular(16),
//                       bottomLeft: Radius.circular(16),
//                       bottomRight: Radius.circular(16),
//                     )
//                   : BorderRadius.only(
//                       topRight: Radius.circular(16),
//                       bottomLeft: Radius.circular(16),
//                       bottomRight: Radius.circular(16),
//                     ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   message,
//                   style: TextStyle(
//                     color: isSentByMe ? Colors.white : Colors.black87,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   time,
//                   style: TextStyle(
//                     color: isSentByMe ? Colors.white70 : Colors.black54,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: isSentByMe ? 8 : 0),
//           if (isSentByMe)
//             CircleAvatar(
//               backgroundColor: Colors.blue.shade300,
//               child: Text('أ'),
//             ),
//         ],
//       ),
//     );
//   }
// }

class FrostedGlassBubble extends StatelessWidget {
  final String message;

  FrostedGlassBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
