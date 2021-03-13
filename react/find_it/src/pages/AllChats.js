import React, { useEffect, useState } from 'react'
import { Redirect, useHistory, useLocation, Router, Switch, Route } from 'react-router-dom'
import { firestoreDB } from '../components/firebase'

const ChatButton = ({ chat }) => {
    const history = useHistory()
    return <div onClick={() => {
        history.push(`/talk/${chat.idUser}`)
    }}>{chat.name}</div>
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
        <>
            {listOfChats.map(chat => <ChatButton chat={chat}/>)}
        </>
    )
}

export default AllChats
