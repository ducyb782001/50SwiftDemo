//
//  ChatEvent.swift
//  MVVMChat
//
//  Created by Lucas van Dongen on 20/09/2018.
//  Copyright © 2018 Departamento B. All rights reserved.
//

import UIKit

enum ChatEvent {
    case applicationInitialized
    case loaded(chats: [Chat])
    case creatingChat(contact: String)
    case created(chat: Chat)
    case createChatFailed(reason: String)
}
