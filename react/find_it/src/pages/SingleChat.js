import React, { useEffect, useState } from 'react'
import Firebase from 'firebase'
import { useCollectionData } from 'react-firebase-hooks/firestore';
import { firestoreDB } from '../components/firebase'
import AllChats from './AllChats'

const SingleChat = ({ match }) => {

    const otherUid = match.params.chatId

    const uid = "DWctr1yJVoaV46SKQxQ5"

    const [ textField, setTextField ] = useState("")

    const chatsRef = firestoreDB.collection('chats')
    const interactions = chatsRef.where('receiver', 'in', [uid, otherUid], 'AND', 'sender', 'in', [uid, otherUid])
    const [messages] = useCollectionData(interactions)

    const sendMessage = () => {
        firestoreDB.collection('chats').add({
            sender: uid,
            receiver: otherUid,
            message: textField,
            createdAt: Firebase.firestore.FieldValue.serverTimestamp()
        })
    }

    return (
        <div style={{ width: '100%' }} >
            {messages && messages.map(message => <div style={{ 
                display: 'flex',
                margin: '10px',
                justifyContent: uid === message.sender ? 'flex-end' : 'flex-start',
                backgroundColor: uid === message.sender ? 'red' : 'blue',
            }}><p>{message.message}</p></div>)}
        <input value={textField} onChange={event => setTextField(event.target.value)}/>
        <button onClick={sendMessage}>GO</button>
        </div>
    )
}

export default SingleChat
