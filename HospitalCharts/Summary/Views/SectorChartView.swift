import SwiftUI
import Charts

struct SectorChartView: View {
   
    
    @State private var selectedNumberOfPatients: Int?
    @State private var selectedDepartment: PatientsSeen? = nil
    
    @Binding var graphType: GraphType
    
    
    let allPatientsSeenByDepartment = MockData.allPatientsSeen
    let colors: [Color] = [.blue, .green, .orange, .purple, .red]
    
   
    
    var body: some View {
            
        NavigationStack {
            Chart{
                ForEach(allPatientsSeenByDepartment){ item in
                    SectorMark(angle: .value("All patients seen", item.total),
                               innerRadius: .ratio(graphType == .donut ? 0.65 : 0),
                               outerRadius: selectedDepartment?.department.rawValue == item.department.rawValue ? 176 : 150,
                               angularInset: graphType == .donut ? 4 : 1.5
                              )
                              .foregroundStyle(item.color)
                    .annotation(position: .overlay){
                        if graphType == .pie{
                            Text("\(item.total)")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                        
                    }
                              .foregroundStyle(by: .value("All patients seen", item.department.rawValue))
                              .cornerRadius(8)
                }
            }
            .chartLegend(Visibility.hidden)
            .chartAngleSelection(value: $selectedNumberOfPatients)
            .onChange(of: selectedNumberOfPatients, { oldValue, newValue in
                if let newValue{
                    withAnimation {
                        getSelectedDepartment(value: newValue)
                    }
                    
                }

            })
            .frame(height: 350)
            .padding(.top, 30)
            .chartBackground{ _ in
                VStack{
                    if graphType == .donut{
                        Image(systemName: "cross.case.fill")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        if let selectedSegment = selectedDepartment{
                            VStack{
                                Text(selectedSegment.department.rawValue)
                                    
                                Text("\(Int(selectedSegment.total)) patients")
                                    
                            }
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        }else{
                            VStack{
                                Text("Select a segment")
                            }
                            
                        }
                    }
                }
            }
            ChartLegendView()
        
           Spacer()
          
        }
    }
    
    private func getSelectedDepartment(value: Int){
        
        var culmativeTotal = 0
        
        let department = allPatientsSeenByDepartment.first{ item in
            culmativeTotal += item.total
            if value <= culmativeTotal{

                selectedDepartment = item


                return true
            }
            return false
        }
        
        
    }
}

#Preview {
    SectorChartView(graphType: .constant(.donut))
}


