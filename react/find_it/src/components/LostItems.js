import React from "react";
import firebase from "firebase";
import { firestoreDB } from "../components/firebase";

function LostItems() {
  const TableBody = document.getElementById("table-body");

  var db = firebase.firestore();
  var col = db.collection("lost-items");
  const lostarr = [];
  var lostitems = col
    .get()
    .then((snapshot) => {
      var content = " ";
      snapshot.forEach((doc) => {
        var ItemData = doc.data();
        console.log(ItemData);
        const timeStampDate = ItemData.datetime;
        //console.log(timeStampDate);
        const dateInMillis = timeStampDate.seconds * 1000;
        //console.log(dateInMillis);
        var date =
          new Date(dateInMillis).toDateString() +
          " at " +
          new Date(dateInMillis).toLocaleTimeString();
        //console.log(date);
        let html = `<tr>
        <td>${ItemData.types[0]}<br>${ItemData.types[1]}${ItemData.types[2]}<br>${ItemData.types[3]}<br>${ItemData.types[4]}<br></td>
        <td>${ItemData.locfound}</td>
        <td>${ItemData.locdeposited}</td>
        <td>${date}</td>
        <td>${ItemData.description}</td>
        <td>${ItemData.foundby}</td>
        <td>${ItemData.claimers[0]}<br>${ItemData.claimers[1]}<br>${ItemData.claimers[2]}<br>${ItemData.claimers[3]}<br>${ItemData.claimers[4]}<br></td>
        <td>${ItemData.owner}</td>
        </tr>`;
        content += html;
        TableBody.innerHTML = content;
      });
    })
    .catch((err) => {
      console.log("Error getting documents", err);
    });

  return (
    <div class="container-fluid">
      <h1 class="h3 mb-2 text-gray-800">Tables</h1>
      <p class="mb-4"></p>

      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">
            Find your lost item here
          </h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table
              class="table table-bordered"
              id="dataTable"
              width="100%"
              cellspacing="0"
            >
              <thead>
                <tr>
                  <th>Type</th>
                  <th>Location Found</th>
                  <th>Location Deposited</th>
                  <th width="300px">Date</th>
                  <th width="300px">Description</th>
                  <th>Found By</th>
                  <th>Claimers</th>
                  <th>Owner</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Type</th>
                  <th>Location Found</th>
                  <th>Location Deposited</th>
                  <th>Date</th>
                  <th>Description</th>
                  <th>Found By</th>
                  <th>Claimers</th>
                  <th>Owner</th>
                </tr>
              </tfoot>
              <tbody id="table-body"></tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}

export default LostItems;
