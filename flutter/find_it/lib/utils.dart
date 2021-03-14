import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class Utils {
  static StreamTransformer transformer<T>(
      T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
        handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
          var snaps = data.docs.map((doc) {

            return doc.data();
          }).toList();
         // print(snaps);
          int index=0;
          for(var snap in snaps){
            snap['id']=data.docs[index].id;
            index++;
          }
          print(snaps);
          final users = snaps.map((json) => fromJson(json)).toList();
          //print(users);
          sink.add(users);
        },
      );

  static DateTime toDateTime(Timestamp value) {
    if (value == null) return null;

    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime date) {
    if (date == null) return null;

    return date.toUtc();
  }
}