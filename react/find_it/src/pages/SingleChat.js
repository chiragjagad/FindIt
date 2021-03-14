import React, { useEffect, useState } from 'react'
import Firebase from 'firebase'
import { useCollectionData } from 'react-firebase-hooks/firestore';
import { firestoreDB } from '../components/firebase'
import SideBar from '../components/Sidebar/Sidebar'

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
        setTextField("")
    }

    return (
        <>
            <div style={{ width: '100%', paddingLeft: '50px', paddingRight: '50px' }} >
                {messages && messages.map(message => <div style={{ 
                    boxShadow: '0px 0px 10px 1px #aaaaaa',
                    display: 'flex',
                    margin: '10px',
                    justifyContent: uid === message.sender ? 'flex-end' : 'flex-start',
                    width: '500px',
                    marginLeft: uid === message.sender ? 'auto' : null,
                    backgroundColor: uid === message.sender ? '#4e73df' : '#ffffff',
                    color: uid === message.sender ? '#ffffff' : '#4e73df',
                    border: 'solid 2px',
                    borderColor: uid === message.sender ? '#ffffff' : '#4e73df',
                    borderRadius: '15px',
                    padding: '10px',
                }}><p>{message.message}</p></div>)}
            <input value={textField} onChange={event => setTextField(event.target.value)}/>
            <button onClick={sendMessage}>GO</button>
            </div>
        </>
    )
}

export default SingleChat
