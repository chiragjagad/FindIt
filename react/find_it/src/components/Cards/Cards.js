import React, { useState } from "react";
import firebase from "firebase";
import { useCollectionData } from "react-firebase-hooks/firestore";
import img from "./img/package.png";

function Cards() {
  const [type0, setType0] = useState("");
  const [type1, setType1] = useState("");
  const [type2, setType2] = useState("");
  const [type3, setType3] = useState("");
  const [type4, setType4] = useState("");
  const [desc, setDesc] = useState("");
  const [fb, setFb] = useState("");
  const [ld, setLd] = useState("");
  const [lf, setLf] = useState("");
  const [owner, setOwner] = useState("");

  var db = firebase.firestore();
  var query = db.collection("lost-items");
  var lostdata = query.where("claimedby", "==", "");
  var founddata = query.where("claimedby", "!=", "");

  const [founditems] = useCollectionData(founddata);
  const [lostitems] = useCollectionData(lostdata);

  console.log(founditems);
  console.log(lostitems);

  const addItem = (Event) => {
    // preventing default nature of form of refresh
    Event.preventDefault();

    db.collection("lost-items").add({
      claimedby: "",
      claimers: [],
      datetime: firebase.firestore.FieldValue.serverTimestamp(),
      description: desc,
      foundby: fb,
      locdeposited: ld,
      locfound: lf,
      owner: owner,
      types: [type0, type1, type2, type3, type4],
    });
    setType0("");
    setType1("");
    setType2("");
    setType3("");
    setType4("");
    setDesc("");
    setFb("");
    setLf("");
    setLd("");
    setOwner("");
  };

  return (
    <div class="container-fluid">
      <div
        class="modal fade bd-example-modal-xl"
        tabindex="-1"
        role="dialog"
        aria-labelledby="myExtraLargeModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                Lost Item Details
              </h5>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label for="type" class="col-form-label">
                    Your name
                  </label>
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    value={fb}
                    onChange={(Event) => setFb(Event.target.value)}
                  />
                </div>
                <div class="form-group">
                  <label for="type" class="col-form-label">
                    Types:
                  </label>
                  <div style={{ display: "flex" }}>
                    <input
                      type="text"
                      class="form-control"
                      id="type0"
                      style={{ marginLeft: "10px", marginRight: "10px" }}
                      value={type0}
                      onChange={(Event) => setType0(Event.target.value)}
                    />
                    <input
                      type="text"
                      class="form-control"
                      id="type1"
                      style={{ marginLeft: "10px", marginRight: "10px" }}
                      value={type1}
                      onChange={(Event) => setType1(Event.target.value)}
                    />
                    <input
                      type="text"
                      class="form-control"
                      id="type2"
                      style={{ marginLeft: "10px", marginRight: "10px" }}
                      value={type2}
                      onChange={(Event) => setType2(Event.target.value)}
                    />
                    <input
                      type="text"
                      class="form-control"
                      id="type3"
                      style={{ marginLeft: "10px", marginRight: "10px" }}
                      value={type3}
                      onChange={(Event) => setType3(Event.target.value)}
                    />
                    <input
                      type="text"
                      class="form-control"
                      id="type4"
                      style={{ marginLeft: "10px", marginRight: "10px" }}
                      value={type4}
                      onChange={(Event) => setType4(Event.target.value)}
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label for="type" class="col-form-label">
                    Where did you find this item?
                  </label>
                  <input
                    type="text"
                    class="form-control"
                    id="loc-found"
                    value={lf}
                    onChange={(Event) => setLf(Event.target.value)}
                  />
                </div>
                <div class="form-group">
                  <label for="type" class="col-form-label">
                    Where did you deposit this item?
                  </label>
                  <input
                    type="text"
                    class="form-control"
                    id="loc-deposit"
                    value={ld}
                    onChange={(Event) => setLd(Event.target.value)}
                  />
                </div>
                <div class="form-group">
                  <label for="type" class="col-form-label">
                    Description
                  </label>
                  <input
                    type="text"
                    class="form-control"
                    id="desc"
                    value={desc}
                    onChange={(Event) => setDesc(Event.target.value)}
                  />
                </div>
                <div class="form-group">
                  <label for="type" class="col-form-label">
                    Owner (if any found through the item)
                  </label>
                  <input
                    type="text"
                    class="form-control"
                    id="owner"
                    value={owner}
                    onChange={(Event) => setOwner(Event.target.value)}
                  />
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
              >
                Close
              </button>
              <button
                type="button"
                class="btn btn-primary"
                data-dismiss="modal"
                onClick={addItem}
              >
                Submit
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <button
          type="button"
          class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
          data-toggle="modal"
          data-target=".bd-example-modal-xl"
        >
          <i
            class="fas fa-download fa-sm text-white-50"
            style={{ marginRight: "10px" }}
          ></i>{" "}
          Add Item
        </button>
      </div>

      <div class="row">
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                    Total Items
                  </div>
                  <div
                    class="h5 mb-0 font-weight-bold text-gray-800"
                    id="total-items-count"
                  >
                    {founditems &&
                      lostitems &&
                      founditems.length + lostitems.length}
                  </div>
                </div>
                <div class="col-auto">
                  <i class="fas fa-bookmark fa-2x text-gray-300"></i>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                    Found Items
                  </div>
                  <div
                    class="h5 mb-0 font-weight-bold text-gray-800"
                    id="found-items-count"
                  >
                    {founditems && founditems.length}
                  </div>
                </div>
                <div class="col-auto">
                  <i class="fas fa-bookmark fa-2x text-gray-300"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                    Pending Items
                  </div>
                  <div
                    class="h5 mb-0 font-weight-bold text-gray-800"
                    id="pending-items-count"
                  >
                    {lostitems && lostitems.length}
                  </div>
                </div>
                <div class="col-auto">
                  <i class="fas fa-bookmark fa-2x text-gray-300"></i>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
          <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
              <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                  <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                    Analysis
                  </div>
                  <div class="row no-gutters align-items-center">
                    <div class="col-auto">
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
                    </div>
                    <div class="col">
                      <div class="progress progress-sm mr-2">
                        <div
                          class="progress-bar bg-info"
                          role="progressbar"
                          style={{ width: "50%" }}
                          aria-valuenow="50"
                          aria-valuemin="0"
                          aria-valuemax="100"
                        ></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-auto">
                  <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-xl-8 col-lg-7">
          <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
              <h6 class="m-0 font-weight-bold text-primary">About Us</h6>
            </div>
            <div class="card-body">
              <img src={img} height="300px"></img>
            </div>
          </div>
        </div>

        <div class="col-xl-4 col-lg-5">
          <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
              <h6 class="m-0 font-weight-bold text-primary">About FINDIT</h6>
            </div>
            <div class="card-body">
              <p>
                This is a web-based application for managing records of lost and
                found items. This software works best to make sure that any lost
                items are returned to their rightful owners. You can find your
                lost item here and claim for it.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Cards;
