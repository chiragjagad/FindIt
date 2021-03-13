import React from "react";
import firebase from "firebase";

function LostItems() {
  var db = firebase.firestore();
  var col = db.collection("lost-items");
  var lostitems = col
    .get()
    .then((snapshot) => {
      console.log(snapshot.val());
      snapshot.forEach((doc) => {});
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
                  <th>Location</th>
                  <th>Date</th>
                  <th>Description</th>
                  <th>Found By</th>
                  <th>Claimers</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Type</th>
                  <th>Location</th>
                  <th>Date</th>
                  <th>Description</th>
                  <th>Found By</th>
                  <th>Claimers</th>
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
