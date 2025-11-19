const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.sendSosNotification = functions.https.onCall(async (data, context) => {
  // Check if the user is authenticated.
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "The function must be called while authenticated.",
    );
  }

  const uid = context.auth.uid;
  const { latitude, longitude } = data;

  if (!latitude || !longitude) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "The function must be called with latitude and longitude data.",
    );
  }

  try {
    // Get the user's name.
    const userDoc = await admin.firestore().collection("users").doc(uid).get();
    const userName = userDoc.data().name || "Someone";

    // Get the user's emergency contacts.
    const contactsSnapshot = await admin
      .firestore()
      .collection("users")
      .doc(uid)
      .collection("emergency_contacts")
      .get();

    if (contactsSnapshot.empty) {
      console.log("No emergency contacts found for user:", uid);
      return {success: false, message: "No emergency contacts found."};
    }

    const tokens = [];
    contactsSnapshot.forEach((doc) => {
      const contact = doc.data();
      if (contact.fcmToken) {
        tokens.push(contact.fcmToken);
      }
    });

    if (tokens.length === 0) {
      console.log("No FCM tokens found for any contacts of user:", uid);
      return {success: false, message: "No contacts have notification tokens."};
    }

    // Send a notification to each contact.
    const payload = {
      notification: {
        title: "SOS Alert!",
        body: `${userName} has triggered an SOS alert and needs help!`,
      },
      data: {
        senderId: uid,
        latitude: latitude.toString(),
        longitude: longitude.toString(),
      }
    };

    const response = await admin.messaging().sendToDevice(tokens, payload);
    console.log("Successfully sent message:", response);

    response.results.forEach((result, index) => {
      const error = result.error;
      if (error) {
        console.error(
          "Failure sending notification to",
          tokens[index],
          error,
        );
      }
    });

    return {success: true, message: "SOS notifications sent."};
  } catch (error) {
    console.error("Error sending SOS notification:", error);
    throw new functions.https.HttpsError(
      "internal",
      "An error occurred while sending notifications.",
    );
  }
});
