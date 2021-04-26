import React, { useState } from "react";
import firebase from "firebase";
import { useCollectionData } from "react-firebase-hooks/firestore";

function LostItems() {
  const TableBody = document.getElementById("table-body");

  var db = firebase.firestore();
  var query = db.collection("lost-items");
  var lost = query.where("claimedby", "==", "");

  const [lostItems] = useCollectionData(lost);
  const onFormSubmit = (e) => {
    e.preventDefault();
    console.log(e.target.value);
  };
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
                  <th width="200px">Date</th>
                  <th width="200px">Description</th>
                  <th>Found By</th>
                  <th>Owner if known</th>
                  <th>Claimers</th>
                  <th>Give claim to</th>
                </tr>
              </thead>
              {lostItems &&
                lostItems.map((item, i) => {
                  console.log(item);
                  console.log(i);
                  const timeStampDate = item.datetime;
                  //console.log(timeStampDate);
                  const dateInMillis = timeStampDate.seconds * 1000;
                  //console.log(dateInMillis);
                  var date =
                    new Date(dateInMillis).toDateString() +
                    " at " +
                    new Date(dateInMillis).toLocaleTimeString();
                  return (
                    <tr key={i}>
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
                      <td>{item.owner}</td>
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
                      <td>
                        <form id={i} onSubmit={onFormSubmit}>
                          <select>
                            <option value={item.claimers[0]}>
                              {item.claimers[0]}
                            </option>
                            <option value={item.claimers[1]}>
                              {item.claimers[1]}
                            </option>
                            <option value={item.claimers[2]}>
                              {item.claimers[2]}
                            </option>
                            <option value={item.claimers[3]}>
                              {item.claimers[3]}
                            </option>
                            <option value={item.claimers[4]}>
                              {item.claimers[4]}
                            </option>
                          </select>
                          <br></br>
                          <button
                            type="submit"
                            class="btn btn-primary"
                            style={{ marginTop: "10px" }}
                          >
                            Claim
                          </button>
                        </form>
                      </td>
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
                  <th>Owner if known</th>
                  <th>Claimers</th>
                  <th>Give claim to</th>
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
