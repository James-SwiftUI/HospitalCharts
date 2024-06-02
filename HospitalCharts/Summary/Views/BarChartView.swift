import SwiftUI
import Charts

struct BarChartView: View {
    
    @State var selectedDepartment: String? = nil
    
    var selectedDepartmentDetails: PatientsSeen?{
        guard let selectedDepartment else { return nil }
        return MockData.allPatientsSeen.first{
            $0.department.rawValue == selectedDepartment
        }
    }
   
    var body: some View {
      
        VStack {
            Chart{
                
                ForEach(MockData.allPatientsSeen){ item in
                    BarMark(x: .value("Department", item.department.rawValue), y: .value("Patients Seen", item.total))
                      .foregroundStyle(by: .value("All patients seen", item.department.rawValue))
                      .annotation(position: .top){
                          Text("\(item.total)")
                      }
                }
                
            }
            .frame(height: 380)
            .chartLegend(Visibility.hidden)
            .chartXSelection(value: $selectedDepartment)
            
            .chartXAxis{
                AxisMarks{}
            }
            .chartYAxis{
                AxisMarks{ value in
                    AxisGridLine()
                        .foregroundStyle(Color.secondary.opacity(0.3))
                    
                   AxisValueLabel{}
                }
            }
            ChartLegendView()
        }
            
        
    }
    
    var annotationView: some View{
        VStack(alignment: .leading){
            Text("\(selectedDepartmentDetails?.department.rawValue ?? "")")
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(.secondarySystemBackground))
                .shadow(color: .secondary.opacity(0.3), radius: 2, x: 2, y: 2)
        )
    }
}

#Preview {
    BarChartView()
        .frame(height: 400)
}



