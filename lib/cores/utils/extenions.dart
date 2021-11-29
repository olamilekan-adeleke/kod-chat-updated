import 'emums.dart';

/// extension for the message eumn
class MessageTypeExtention {
  static String enumToString(MessageType messageType) {
    switch (messageType) {
      case MessageType.text:
        return 'text';
      case MessageType.image:
        return 'image';
      case MessageType.video:
        return 'video';
      case MessageType.document:
        return 'document';
    }
  }

  static MessageType stringToEunm(String string) {
    switch (string) {
      case 'text':
        return MessageType.text;
      case 'image':
        return MessageType.image;
      case 'video':
        return MessageType.video;
      case 'document':
        return MessageType.document;
      default:
        return MessageType.text;
    }
  }
}
