import React from "react";
import firebase from "firebase";
import { useCollectionData } from "react-firebase-hooks/firestore";

function LostItems() {
  const TableBody = document.getElementById("table-body");

  var db = firebase.firestore();
  var query = db.collection("lost-items");

  const [lostItems] = useCollectionData(query);

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
