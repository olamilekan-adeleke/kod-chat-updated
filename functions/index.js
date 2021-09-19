const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onNewChatAdded = functions.database
  .ref("chats/{chatId}")
  .onCreate(async (snaphot, context) => {
    functions.logger.log(snaphot);
    functions.logger.log(context);

    const chatJustAdded = Object.values(snaphot.val())[0];
    functions.logger.log(chatJustAdded);

    const roomId = chatJustAdded.room_id;
    const conversationRoomId = chatJustAdded.conversation_room_id;
    const senderId = chatJustAdded.sender_id;
    const receiverid = chatJustAdded.receiver_id;
    const timestamp = chatJustAdded.timestamp;
    const message = chatJustAdded.message;

    functions.logger.log(
      roomId,
      conversationRoomId,
      senderId,
      receiverid,
      timestamp
    );

    if (roomId !== undefined && conversationRoomId !== undefined) {
      updataConversation(conversationRoomId);
    } else {
      const senderData = await getUserData(senderId);
      functions.logger.log(senderData);
      const receiverData = await getUserData(receiverid);
      functions.logger.log(receiverData);

      const data = {
        last_message: chatJustAdded,
        timestamp: timestamp,
        members: [senderId, receiverid],
        chat_room_id: context.params.chatId,
        [senderId]: {
          full_name: senderData.data().full_name,
          profile_pic_url: senderData.data().profile_pic_url,
        },
        [receiverid]: {
          full_name: receiverData.data().full_name,
          profile_pic_url: receiverData.data().profile_pic_url,
        },
      };
      await createNewConversation(data);

      await sendNotificationToUser(
        receiverid,
        senderData.data().full_name,
        message
      );
    }

    return Promise.resolve();
  });

async function sendNotificationToUser(userId, senderName, message) {
  const payload = {
    notification: {
      title: `${senderName}`,
      body: `${message}`,
    },
    data: {
      data_to_send: "msg_from_the_cloud",
      click_action: "FLUTTER_NOTIFICATION_CLICK",
    },
  };

  const options = {
    priority: "high",
    timeToLive: 60 * 60 * 24,
  };

  return admin
    .messaging()
    .sendToTopic(`${userId}`, payload, options)
    .then(() => {
      console.info("function executed succesfully: sent notification");
      // return {msg: "function executed succesfully"};
    })
    .catch((error) => {
      console.info("error in execution: notification not sent");
      console.log(error);
      return { msg: "error in execution: notification not sent" };
    });
}

async function updataConversation(docId, data) {
  return await admin
    .firestore()
    .collection("conversations")
    .doc(`${docId}`)
    .update({
      last_message: data,
      timestamp: admin.firestore.Timestamp.now(),
    });
}

async function createNewConversation(data) {
  return await admin.firestore().collection("conversations").add(data);
}

async function getUserData(id) {
  return await admin.firestore().collection("users").doc(id).get();
}
