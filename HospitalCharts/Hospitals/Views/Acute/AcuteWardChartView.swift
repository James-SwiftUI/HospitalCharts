import SwiftUI
import Charts

// Admissions and Discharges By Day

struct AcuteWardChartView: View {
    
    @Environment(\.dismiss) var dismiss
    let admissionsAndDischarges = generateData()
    @Binding var wardName: String
    @Binding var wardTotal: Int
    
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Section{
                    Chart(admissionsAndDischarges){ item in
                        BarMark(x: .value("Days", item.theDay), y: .value("Quantity", item.actual))
                            .annotation(position: item.action == .patientsIn ? .top : .bottom){
                                Text("\(item.actual)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .foregroundStyle(item.action == .patientsIn ? .green : .blue)
                    }
                    .frame(height: 400)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                    .chartYAxis{
                        
                    }
                    .chartXAxis{
                        AxisMarks{
                            AxisValueLabel()
                             
                        }
                    }
                    
                    Spacer()
                }header: {
                    HStack{
                        Image(systemName: "cross.circle")
                            .symbolRenderingMode(.multicolor)
                            .imageScale(.large)
                        Text("Admissions and Discharges By Day")
                            .fontWeight(.semibold)
                    }
                    
                }
               
                .padding()
        
                Section{
                    Chart{
                        SectorMark(angle: .value("Admitted",totalPatientsByWeek(inOrOut: "In")))
                            .foregroundStyle(.primary)
                           
                            .annotation(position: .overlay){
                                Text("\(totalPatientsByWeek(inOrOut: "In"))")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                        SectorMark(angle: .value("Discharged",totalPatientsByWeek(inOrOut: "Out")))
                            .foregroundStyle(.green)
                            .annotation(position: .overlay){
                                Text("\(totalPatientsByWeek(inOrOut: "Out"))")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                    }
                    .padding()
                    .frame(height: 300)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                    
                    HStack{
                        Label("Admitted", systemImage: "square.fill")
                            .foregroundStyle(.green)
                        Spacer()
                        Label("Discharged", systemImage: "square.fill")
                            .foregroundStyle(.blue)
                    }
                    .padding(.horizontal)
                }header: {
                    
                    HStack{
                        Image(systemName: "calendar")
                            .symbolRenderingMode(.multicolor)
                            .imageScale(.large)
                        Text("Total Patients Admitted & Discharged")
                            .fontWeight(.semibold)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
            }
            .padding(.top, 20)
            .navigationTitle("\(wardName) - \(wardTotal) Total Beds")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Button{
                        dismiss()
                    }label: {
                        Label("Close", systemImage: "x.circle.fill")
                    }
                    
                }
            }
        }
        
        
        
    }
    
    static func generateData() -> [PatientLog]{
        var wards = [PatientLog]()
        let range = 1...7
    
        
        for day in range{
            
            let patientsIn = Int.random(in: 1...5)
            let patientsOut = Int.random(in: 2...6)
            
            let wardItemIn = PatientLog(days: day, numderOfPatiens: patientsIn, action: .patientsIn)
            wards.append(wardItemIn)
            
            let wardItemOut = PatientLog(days: day, numderOfPatiens: patientsOut, action: .patientsOut)
            wards.append(wardItemOut)
        }
        
        return wards
    }
    
    func totalPatientsByWeek(inOrOut: String)-> Int{
        var totalIn = 0
        var totalOut = 0
        
        for patient in admissionsAndDischarges{
            if patient.action == .patientsOut{
                totalIn += patient.numderOfPatiens
            }else{
                totalOut += patient.numderOfPatiens
            }
            
        }
        if inOrOut == "In"{
            return totalIn
        }else{
            return totalOut
        }
        
        
        
    }
}

#Preview {
    AcuteWardChartView(wardName: .constant("Oak Ward"), wardTotal: .constant(20))
}
