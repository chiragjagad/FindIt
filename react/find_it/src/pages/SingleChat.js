import React, { useEffect, useState } from 'react'
import Firebase from 'firebase'
import { useCollectionData } from 'react-firebase-hooks/firestore';
import { firestoreDB } from '../components/firebase'
import AllChats from './AllChats'

const SingleChat = ({ match }) => {

    const query = firestoreDB.collection('chats/DWctr1yJVoaV46SKQxQ5/messages')
    const [messages] = useCollectionData(query)

    return (
        <div>
            {messages && messages.map(message => <div>{message.idUser}</div>)}
        </div>
    )
}

export default SingleChat
