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
            .padding(.horizontal, 8)
            .frame(height: 350)
            Spacer()
            
        }
    }
}

#Preview {
    AandEAttendanceCurrentView()
}
