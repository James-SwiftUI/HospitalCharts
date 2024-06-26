import SwiftUI
import Charts


struct AandEAttendanceCurrentView: View {
    
    
    
    
    var body: some View {
        VStack {
            Text("A and E Attendance Today")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            Chart(MockData.AandEThisWeek){ item in
                BarMark(x: .value("Day", item.date, unit: .hour), y: .value("Total Attendances", item.totalNumber))
            }
            .chartXAxis{
                AxisMarks(values: .stride(by: .hour)) {
                    AxisValueLabel(format: .dateTime.hour(), centered: true)
                }
            }
            .padding(.horizontal, 8)
            .frame(height: 350)
            HStack{
                Text("Attendance Over time")
                    .font(.headline.monospaced())
            }
            Spacer()
            
        }
    }
    
  
    
   
}

#Preview {
    AandEAttendanceCurrentView()
}
