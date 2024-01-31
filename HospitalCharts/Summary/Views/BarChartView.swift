import SwiftUI
import Charts

struct BarChartView: View {
    let allPatientsSeen: [PatientsSeen] = [
        .init(total: 255, department: .cardiology),
        .init(total: 121, department: .gastroerolgy),
        .init(total: 89, department: .neurology),
        .init(total: 325, department: .opthalmology),
        .init(total: 73, department: .surgery)
    ]
    var body: some View {
      
        Chart{
            ForEach(allPatientsSeen.sorted(by: { $0.total > $1.total })){ item in
                BarMark(x:
                        .value(
                            "Department",
                            item.department.rawValue),
                            y: .value(
                                "Patients seen",
                                Int(item.total)
                            )
                    )
                    .foregroundStyle(by: .value("All patients seen", item.department.rawValue))
                
            }
            
        }
            
            
        
    }
}

#Preview {
    BarChartView()
}
