import SwiftUI
import Charts

//Arrival in A & E 


struct ArrivalAttendanceBarChartView: View {


    let showTheLegend: Bool
    var patientAttendance: [Attendance] = generateData()
    var frameHeight: CGFloat
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Chart{
                    ForEach(patientAttendance){ item in
                        BarMark(x: .value("Attendence", item.month), y: .value("Type", item.total))
                            .foregroundStyle(by: .value("Color", item.color))
                    }
                }
                .chartLegend(.hidden)
                .chartForegroundStyleScale([
                    "Green": .green, "Red": .red, "Blue": .blue, "Orange": .orange,
                ])
                .frame(height: frameHeight)
                if showTheLegend{
                    ChartLegend()
                }
                
                Spacer()
            }
            .navigationTitle("Arrival in A & E 🚑")
            .padding(.horizontal)
            .padding(.top, 20)
        
        }
    }
    
    static func generateData() -> [Attendance]{
        var patientAttendance: [Attendance] = []
        
        for month in monthSelection{
            attendanceTypes.forEach{ item in
                let total: Int
                switch item{
                    
                case .ambulance:
                    total = Int.random(in: 120...220)
                case .helicopter:
                    total = Int.random(in: 20...50)
                case .walkin:
                    total = Int.random(in: 280...500)
                case .police:
                    total = Int.random(in: 85...145)
                }
                
                patientAttendance.append(Attendance(month: month, attendence: item, total: total, color: item.colorName))
            }
            
        }
        return patientAttendance
    }
}


#Preview {
    ArrivalAttendanceBarChartView(showTheLegend: true, frameHeight: 400.0)
}


struct ChartLegend: View {
    var body: some View {
        ForEach(AttendanceType.allCases){ item in
            HStack {
                Image(systemName: "square.fill")
                    .foregroundColor(item.color)
                Text(item.rawValue)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
        }
    }
}
