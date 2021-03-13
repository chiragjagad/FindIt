import React from 'react';
import firebase from "firebase";
import { db } from "../components/firebase";
import { Redirect, useHistory,useLocation } from "react-router-dom";
const Register = ()=>{
    const [name,setName]=React.useState("");
    const [email,setEmail]=React.useState("");
    const [pass,setPass]=React.useState("");
    const [rep, setRep] = React.useState("");
    const onFormSubmit=(e)=>{
        e.preventDefault();
        if(pass!==rep||pass===""){
            alert("Entered passwords don't match");
        }else{
            firebase.auth().createUserWithEmailAndPassword(email, pass)
                .then((userCredential) => {
                    // Signed in 
                    var user = userCredential.user;
                    console.log(user);

                    // ...
                })
                .catch((error) => {
                    var errorCode = error.code;
                    var errorMessage = error.message;
                    console.log(errorCode);
                    // ..
                });
        }
        
    }
    
    return(
    <>
    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" onSubmit={onFormSubmit}>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="Name of the Organization" value={name} onChange={e=>setName(e.target.value)}/>
                                    </div>
                                    </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address" value={email} onChange={e=>setEmail(e.target.value)}/>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="Password" onChange={e=>setPass(e.target.value)} value={pass}/>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="Repeat Password" value={rep} onChange={e=>setRep(e.target.value)}/>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </button>
                               
                                
                            </form>
                            <hr/>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    </>
    );
}
export default Register;