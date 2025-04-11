import UserNotifications
import Foundation

@objc public class NotificationManager: NSObject {

    private var hasActiveNotification = false
    
    // Request permission to send notifications
    public func requestPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting permission: \(error)")
            }
        }
    }

    // Schedule a local notification
    @objc public func scheduleNotification() {
        if (!hasActiveNotification) {
            let content = UNMutableNotificationContent()
            content.title = "Hello!"
            content.body = "This is a location notification."
            content.sound = UNNotificationSound.default
            
            // Create a trigger to send the notification immediately
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            // Create a request with a unique identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            // Schedule the notification
            let center = UNUserNotificationCenter.current()
            center.add(request) { error in
                if let error = error {
                    
                }
            }
            hasActiveNotification = true
        }
    }
        
        // Schedule a local notification
        @objc public func scheduleErrorNotification() {
            let content = UNMutableNotificationContent()
            content.title = "Hello!"
            content.body = "This is an error local notification."
            content.sound = UNNotificationSound.default
            
            // Create a trigger to send the notification immediately
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            // Create a request with a unique identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            // Schedule the notification
            let center = UNUserNotificationCenter.current()
            center.add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                }
            }
        }
}
