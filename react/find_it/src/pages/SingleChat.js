import React, { useEffect } from 'react'
import AllChats from './AllChats'

const Talk = ({ match }) => {

    const chatId = match.params.chatId

    useEffect(() => {
        console.log(chatId)
    }, [])

    return <div>{chatId}</div>
}

export default Talk
