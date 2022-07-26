//
//  PushNotificationController+StubMessageSending.swift
//  MVCChat
//
//  Created by Lucas van Dongen on 17/09/2018.
//  Copyright © 2018 Departamento B. All rights reserved.
//

import UIKit
import UserNotifications

extension PushNotificationController: StubMessageSending {
    class func send(stub message: Message, after timeInterval: TimeInterval = 0.1) {
        guard case .other(let contact) = message.sender else {
            return
        }

        let unreadCount = ChatModel.unreadMessageCount()

        let content = UNMutableNotificationContent()
        content.title = contact
        content.subtitle = DateRenderer.string(from: message.sendDate)
        content.body = message.message
        content.badge = NSNumber(value: unreadCount)

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)

        let requestIdentifier = "demoNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request,
                                               withCompletionHandler: { error in
                                                if let error = error {
                                                    print(error)
                                                }
        })
    }
}
