import React, { useEffect, useState } from 'react'
import Firebase from 'firebase'
import { useCollectionData } from 'react-firebase-hooks/firestore';
import { firestoreDB } from '../components/firebase'
import AllChats from './AllChats'

const SingleChat = ({ match }) => {

    const uid = "DWctr1yJVoaV46SKQxQ5"

    const query = firestoreDB.collection(`chats/${uid}/messages`)
    const [messages] = useCollectionData(query)

    return (
        <div style={{ width: '100%' }} >
            {messages && messages.map(message => <div style={{ 
                display: 'flex',
                margin: '10px',
                justifyContent: uid === message.idUser ? 'flex-end' : 'flex-start',
                backgroundColor: uid === message.idUser ? 'red' : 'blue',
            }}><p>{message.idUser}</p></div>)}
        </div>
    )
}

export default SingleChat
