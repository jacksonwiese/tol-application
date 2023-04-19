//
//  CustomDatePicker.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/17/23.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    
    // Month update on arrow button clicks...
    @State var currentMonth: Int
    
    var body: some View {
        VStack(spacing: 35) {
            
            //Days....
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            //Nav Bar
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[0]) //[0] is pulling the Year
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1]) //[1] is pulling the Month
                        .font(.title.bold())
                    
                }
                
                Spacer(minLength: 0)
                
                Button{
                    withAnimation{
                        currentMonth -=  1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                }
                
                Button{
                    withAnimation{
                        currentMonth +=  1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title)
                }
            }
            .padding(.horizontal)
            
            //Day view
            HStack(spacing: 0) {
                ForEach(days, id: \.self) {day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            //Dates
            //Lazy Grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()){value in
                    CardView(value: value)
                        .background(
                        
                            Capsule()
                                .fill(Color(.gray))
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                            
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            
            VStack(spacing: 15) {
               
                Text("Goals")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)
                if let goal = goals.first(where: { goal in
                    return isSameDay(date1: goal.goalDate, date2: currentDate)
                }) {
                    ForEach(goal.goal){ goal in
                        VStack(alignment: .leading, spacing: 10) {
                            
                            //For custom timing
                            //Text(goal.time.addTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                            Text(Date(timeInterval: TimeInterval(CGFloat.random(in: 0...5000)), since: goal.time), style: .time)
                            
                            Text(goal.title)
                                .font(.title2.bold())
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color(.purple)
                                .opacity(0.5)
                                .cornerRadius(10)
                        )
                    }
                }
                else {
                    Text("No goals found")
                }
            }
            .padding()

        }
        .onChange(of: currentMonth) { newValue in
            //updating Month
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View{
        VStack {
            if value.day != -1{
                
                if let goal = goals.first(where: { goal in
                    
                    //bug here
                    return isSameDay(date1: goal.goalDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: goal.goalDate, date2: currentDate) ? .white : .blue)
                        .frame(maxWidth: .infinity)

                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: goal.goalDate, date2: currentDate) ? .white : Color(.gray))
                        .frame(width: 8, height: 8)
                }
                else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1:  value.date, date2: currentDate) ? .white : .blue)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    
    //checking dates...
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    //extracting year and month for display
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        //Getting current month date
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    func getCurrentMonthInt(from date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: date)
        guard let month = components.month else {
            fatalError("Could not get month from date")
        }
        return month
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        
        //Getting current month date
        let currentMonth = getCurrentMonth()
        
        
        var days =  currentMonth.getAllDates().compactMap { date -> DateValue in
            // getting day
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        //adding offset days for start of the month
        let FirstWeekday =  calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<FirstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
        
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Extension Date to get current month's dates
extension Date {
    
    func getAllDates() -> [Date] {
        
        let calendar = Calendar.current
        
        // getting Start date...
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        //getting date...
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
