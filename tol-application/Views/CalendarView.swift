//
//  CalendarView.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/13/23.
//

import SwiftUI

struct CalendarView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        
            VStack(spacing: 20) {
                
                
                //Custom Date Picker
                CustomDatePicker(currentDate: $currentDate, currentMonth: getCurrentMonthInt(from: currentDate))
            }
            .padding(.vertical)
        }
        // Safe area view...
        .safeAreaInset(edge: .bottom) {
            HStack{
                Button {
                    
                } label: {
                    Text("Add Journal")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color(.orange), in: Capsule())
                }
                
                Button {
                    
                } label: {
                    Text("Add Recording")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color(.purple), in: Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
    }
    
    func getCurrentMonthInt(from date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: date)
        guard let month = components.month else {
            fatalError("Could not get month from date")
        }
        return month
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

