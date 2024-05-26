import SwiftUI
import Charts

struct ThumbnailAttendanceView: View {
    
    var randomValues: [Int] = [9, 7, 12, 6, 11, 5, 8, 13, 10, 4]
    
    var body: some View {
        Chart{
            ForEach(randomValues, id: \.self){ random in
                BarMark(x: .value("Hour", "\(random)"), y: .value("Patients", random))
            }
        }
        .padding()
        .frame(height: 180)
        
        .background(
            RoundedRectangle(cornerRadius: 18)
                .foregroundStyle(.gray.opacity(0.3))
        )
        .padding(.horizontal)
        .chartXAxis{}
        .chartYAxis{}
    }
}

#Preview {
    ThumbnailAttendanceView()
}
