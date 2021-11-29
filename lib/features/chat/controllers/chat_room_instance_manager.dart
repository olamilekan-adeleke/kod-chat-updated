import 'package:get/get.dart';
import 'package:kod_chat/cores/utils/navigator_service.dart';
import 'package:kod_chat/cores/utils/route_name.dart';
import 'package:kod_chat/features/chat/controllers/chat_messages_controller.dart';

class ChatRoomInstanceManager extends GetxController {
  List<String> roomList = [];

  void navigateToChatPage(String roomId) {
    if (roomList.contains(roomId) == false) {
      ///  we are checking if room id is already store, if it is not store we create a new instance of chat messages controller and
      /// that will create a new instance of chat messages controller which will have the data/chat relating to that room
      Get.put<ChatMessagesController>(ChatMessagesController(), tag: roomId);
      roomList.add(roomId);
    }

    NavigationService.navigateTo(RouteName.chatHome);
  }

  void reloadChatRoom(){
    
  }
}
