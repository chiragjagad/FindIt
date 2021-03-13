import React from "react";
import firebase from "firebase";

function LostItems() {
  const TableBody = document.getElementById("table-body");

  var db = firebase.firestore();
  var col = db.collection("lost-items");
  const lostarr = [];
  var lostitems = col
    .get()
    .then((snapshot) => {
      var content = "";
      snapshot.forEach((doc) => {
        var ItemData = doc.data();
        console.log(ItemData);
        let html = `<tr>
        <td>${ItemData.types}</td>
        <td>${ItemData.locfound}</td>
        <td>${ItemData.locdeposited}</td>
        <td>${ItemData.datetime}</td>
        <td>${ItemData.description}</td>
        <td>${ItemData.foundby}</td>
        <td>${ItemData.claimers}</td>
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
      <p class="mb-4">
        DataTables is a third party plugin that is used to generate the demo
        table below. For more information about DataTables, please visit the{" "}
        <a target="_blank" href="https://datatables.net">
          official DataTables documentation
        </a>
        .
      </p>

      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
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
                  <th>Date</th>
                  <th>Description</th>
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
