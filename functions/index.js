const functions = require("firebase-functions");
const { v4: uuidv4 } = require("uuid");
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
    const isFirstTime = chatJustAdded.is_first_time;
    const senderId = chatJustAdded.sender_id;
    const receiverId = chatJustAdded.receiver_id;
    const timestamp = chatJustAdded.timestamp;
    const message = chatJustAdded.message;

    functions.logger.log(
      roomId,
      conversationRoomId,
      senderId,
      receiverId,
      timestamp
    );

    // get sender info
    const senderData = await getUserData(senderId);
    functions.logger.log(senderData);

    // send notification to user
    await sendNotificationToUser(
      receiverId,
      senderData.data().full_name,
      message
    );

    if (isFirstTime === false) {
      // update conversation document
      await updateConversation(conversationRoomId, chatJustAdded);
    } else {
      // get receiver data
      const receiverData = await getUserData(receiverId);
      functions.logger.log(receiverData);

      const data = {
        last_message: chatJustAdded,
        timestamp: timestamp,
        members: [senderId, receiverId],
        chat_room_id: context.params.chatId,
        [senderId]: {
          full_name: senderData.data().full_name,
          profile_pic_url: senderData.data().profile_pic_url,
        },
        [receiverId]: {
          full_name: receiverData.data().full_name,
          profile_pic_url: receiverData.data().profile_pic_url,
        },
      };

      await createNewConversation(data);
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
      // TODO: add user image url
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
      console.info("function executed successfully: sent notification");
      // return {msg: "function executed successfully"};
    })
    .catch((error) => {
      console.info("error in execution: notification not sent");
      console.log(error);
      return { msg: "error in execution: notification not sent" };
    });
}

async function updateConversation(docId, data) {
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
  const id = uuidv4();

  return await admin
    .firestore()
    .collection("conversations")
    .doc(id)
    .set({
      conversation_room_id: id,
      ...data,
    });
}

async function getUserData(id) {
  return await admin.firestore().collection("users").doc(id).get();
}
