//
//  ReminderView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI
import UserNotifications
struct ReminderView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    @State private var reminderText: String = ""
    @State private var selectedDays: Set<DayOfWeek> = []
    @State private var notificationTime: Date = Date()
    
    @State private var isShown = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlueBG)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                        }
                        .frame(width: 50)
                        
                        Spacer()
                        
                        Text("Reminder")
                            .foregroundStyle(.white)
                            .bold()
                        
                        
                        Spacer()
                        
                        HStack {}
                            .frame(width: 50)
                    }

                    TextField("Enter Reminder Text", text: $reminderText)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.blueCard)
                        }
                        .padding(.top)
                        .foregroundStyle(.white)
                        .tint(.white)
                    
                    // Кнопки для выбора дней недели
                    HStack {
                        ForEach(DayOfWeek.allCases, id: \.self) { day in
                            Button(action: {
                                if selectedDays.contains(day) {
                                    selectedDays.remove(day)
                                } else {
                                    selectedDays.insert(day)
                                }
                            }) {
                                Text(day.rawValue)
                                    .padding(8)
                                    .background(selectedDays.contains(day) ? Color.purpleButton : Color.blueCard)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                    
                    DatePicker("Notification Time", selection: $notificationTime, displayedComponents: .hourAndMinute)
                        .padding()
                        .preferredColorScheme(.dark)
                    
                    Button(action: {
                        if reminderText.isEmpty && selectedDays.isEmpty {
                            scheduleNotifications()
                        }
                        isShown.toggle()
                    }) {
                        Text("Save")
                            .padding()
                            .foregroundStyle(.purpleButton)
                            .frame(maxWidth: .infinity)
                            .background(Color.greenButton)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .opacity((!reminderText.isEmpty && !selectedDays.isEmpty) ? 1 : 0.5)
                            
                    }
                    .disabled((reminderText.isEmpty && !selectedDays.isEmpty))
                    .padding()
                }
                .padding()
                
                Spacer()
            }
        }
        .alert("The reminder has been set.", isPresented: $isShown) {
            Button {
                dismiss()
            } label: {
                Text("Ok")
            }
        }
        
    }
    
    
    private func scheduleNotifications() {
        let content = UNMutableNotificationContent()
        content.title = "Reminder!"
        content.body = reminderText
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: notificationTime)
        let minute = calendar.component(.minute, from: notificationTime)
        
        for day in selectedDays {
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minute
            dateComponents.weekday = day.calendarValue
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else {
                    print("Notif Success \(day.rawValue) в \(hour):\(minute)")
                }
            }
        }
    }
}


enum DayOfWeek: String, CaseIterable {
    case Monday = "Mo"
    case Tuesday = "Tu"
    case Wednesday = "We"
    case Thursday  = "Th"
    case Friday = "Fr"
    case Saturday = "Sa"
    case Sunday = "Su"
    
    var calendarValue: Int {
        switch self {
        case .Monday: return 2
        case .Tuesday: return 3
        case .Wednesday: return 4
        case .Thursday: return 5
        case .Friday: return 6
        case .Saturday: return 7
        case .Sunday: return 1
        }
    }
}


//#Preview {
//    ReminderView()
//}
