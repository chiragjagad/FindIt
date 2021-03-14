import React from "react";
import firebase from "firebase";
import { useCollectionData } from "react-firebase-hooks/firestore";

function FoundItems() {
  const TableBody = document.getElementById("table-body");

  var db = firebase.firestore();
  var query = db.collection("lost-items");
  var found = query.where("claimedby", "!=", "");

  const [founditems] = useCollectionData(found);

  return (
    <div class="container-fluid">
      <h1 class="h3 mb-2 text-gray-800">Tables</h1>
      <p class="mb-4"></p>

      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">
            Find your found item here
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
                  <th>Claimed by</th>
                </tr>
              </thead>
              {founditems &&
                founditems.map((item) => {
                  const timeStampDate = item.datetime;
                  //console.log(timeStampDate);
                  const dateInMillis = timeStampDate.seconds * 1000;
                  //console.log(dateInMillis);
                  var date =
                    new Date(dateInMillis).toDateString() +
                    " at " +
                    new Date(dateInMillis).toLocaleTimeString();
                  return (
                    <tr>
                      <td>
                        {item.types[0]}
                        <br />
                        {item.types[1]}
                        <br />
                        {item.types[2]}
                        <br />
                        {item.types[3]}
                        <br />
                        {item.types[4]}
                        <br />
                      </td>
                      <td>{item.locfound}</td>
                      <td>{item.locdeposited}</td>
                      <td>{date}</td>
                      <td>{item.description}</td>
                      <td>{item.foundby}</td>
                      {item.claimers == null ? (
                        <td></td>
                      ) : (
                        <td>
                          {item.claimers[0]}
                          <br />
                          {item.claimers[1]}
                          <br />
                          {item.claimers[2]}
                          <br />
                          {item.claimers[3]}
                          <br />
                          {item.claimers[4]}
                          <br />
                        </td>
                      )}
                      <td>{item.claimedby}</td>
                    </tr>
                  );
                })}
              <tfoot>
                <tr>
                  <th>Type</th>
                  <th>Location Found</th>
                  <th>Location Deposited</th>
                  <th>Date</th>
                  <th>Description</th>
                  <th>Found By</th>
                  <th>Claimers</th>
                  <th>Claimed by</th>
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

export default FoundItems;
