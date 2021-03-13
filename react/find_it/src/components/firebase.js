import firebase from "firebase";

const firebaseApp = firebase.initializeApp({
          apiKey: "AIzaSyBM0xrLUZ3RACucl2XGMleG15XaimG-WzM",
          authDomain: "find-it-fe243.firebaseapp.com",
          projectId: "find-it-fe243",
          storageBucket: "find-it-fe243.appspot.com",
          messagingSenderId: "97059543954",
          appId: "1:97059543954:web:b7153976dcba672d7b7f4b"
  });

const db = firebaseApp.database();

const firestoreDB = firebase.firestore()

export { db, firestoreDB };
