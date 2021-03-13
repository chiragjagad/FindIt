import React, { useEffect, useState } from 'react'
import { Redirect, useHistory, useLocation, Router, Switch, Route } from 'react-router-dom'
import { firestoreDB } from '../components/firebase'
import Avatar from './avatar.png'
const ChatButton = ({ chat }) => {
    const history = useHistory()
    return (
    <div style={{textAlign:"initial"}}>
        <div onClick={() => {
            history.push(`/chat/${chat.idUser}`)
        }}>
        <img style={{borderRadius:"100%",width:'50px',display:'inline-block'}} src={Avatar}/>
        <h4 style={{display:'inline-block',marginLeft:'25px'}}>{chat.name}</h4>
        </div>
        <hr/>
    </div>
    )
}

const AllChats = () => {

    const [ listOfChats, setListofChats ] = useState([])

    const getAdmins = async () => {
        const query = firestoreDB.collection('users')
        const snapshot = await query.get()
        const newList = []
        snapshot.forEach(doc => newList.push(doc.data()))
        setListofChats(newList)
    }

    useEffect(() => {
        getAdmins()
    }, [])

    return (
        <div style={{textAlign:"center",margin:'2rem auto',width:'80%'}}>
            <div style={{height:'50px'}}>
                <h1>Talk</h1>
            </div>
            <div style={{padding:'15px'}}>
                {listOfChats.map(chat => <ChatButton chat={chat}/>)}
            </div>
        </div>
        
    )
}

export default AllChats
