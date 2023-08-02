//
//  SwiftNoti.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/16.
//

import SwiftUI
import UserNotifications

// UNNotification in SwiftUI
// 
struct SwiftNoti: View {
    @State var alert = false
    var body: some View {
        Button(action: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { status, _ in
                if status {
                    let content = UNMutableNotificationContent()
                    content.title = "Notification"
                    content.body = "Hello From KavSoft!"
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                    return
                }
                self.alert.toggle()
            }
        }, label: {
          Text("Send Notification")
        })
        .alert(isPresented: $alert) {
            return Alert(title: Text("Please Enable Notifiation Access in Settings Pannel!!"))
        }
    }
}

struct SwiftNoti_Previews: PreviewProvider {
    static var previews: some View {
        SwiftNoti()
    }
}
