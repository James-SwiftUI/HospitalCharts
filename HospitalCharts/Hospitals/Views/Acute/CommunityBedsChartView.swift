import SwiftUI
import Charts
struct CommunityBedsChartView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var wardName: String
    @Binding var beds: Int
    
    @State private var selectedBedValue: String?
    
    @State var patientStay: [PatientStay] = loadPatientStay()
    
    var selectedBed: PatientStay?{
        guard let selectedBedValue else { return nil }
        return patientStay.first{
            $0.bedName == selectedBedValue
        }
    }
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ScrollView(.horizontal){
                        Chart{
                            
                            ForEach(patientStay){ bedStay in
                                BarMark(x: .value("Patient", bedStay.bedName), y: .value("Stay Days", bedStay.nightsStayed))
                                  .foregroundStyle(bedStay.nightsStayed > 14 ? .red : .blue)
                                RuleMark(y: .value("Long Stay", 14))
                                    .lineStyle(StrokeStyle(dash: [15.0, 5.0]))
                                    .foregroundStyle(.red
                                    )
                                }
                            }
                        
                            .chartPlotStyle{ plotArea in
                                plotArea
                                    .frame(width: 850, height: 350)
                            }
                            .chartXSelection(value: $selectedBedValue)
//                            .onChange(of: selectedBedValue, { oldValue, newValue in
//                                print(newValue ?? 0)
//                            })
                            .padding()
                            .chartLegend(.hidden)
                    }
                }header: {
                    Text("Days Occupied By Patient")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                Section{
                    if let selectedBedValue{
                        VStack(alignment: .leading, spacing: 12){
                            Label("\(selectedBedValue)", systemImage: "bed.double.fill")
                            Label(selectedBed?.patientName ?? "", systemImage: "person.fill")
                            Label("Stayed: \(selectedBed?.nightsStayed ?? 0) nights", systemImage: "moon.fill")
                          
                        }
                        
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle(wardName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Button{
                        dismiss()
                    }label: {
                        Label("Close", systemImage: "x.circle.fill")
                    }
                    .imageScale(.large)

                }
            }
        }
        
    }
    
    static func loadPatientStay() -> [PatientStay]{
        
        var tempArr: [PatientStay] = []
        
        
        let patients = ["Olivia Johnson",
                        "Amelia Smith",
                        "Isla Brown",
                        "Harry Taylor",
                        "Jack Williams",
                        "George Davies",
                        "Emily Evans",
                        "Sophie Wilson",
                        "James Thomas",
                        "William Roberts",
                        "Ava Johnson",
                        "Mia Walker",
                        "Noah White",
                        "Ethan Hall",
                        "Charlotte Green"]
        
        for number in 1...15{
                let randomNumber = Int.random(in: 1...3)
                
                tempArr.append(PatientStay(bedName: "Bed \(number)", nightsStayed: number * randomNumber, patientName: patients[number - 1]))
        }
        
        return tempArr
    }
}

#Preview {
    CommunityBedsChartView(wardName: .constant("Dolphin Ward"),beds: .constant(20))
}


//                                ForEach(1...beds, id: \.self){ item in
//
//                                    //let randomNumber = Int.random(in: 1...3)
//
//                                    BarMark(x: .value("Patient", "Bed \(item )"), y: .value("Stay Days", randomNumber * item))
//                                        .foregroundStyle(by: .value("Patient", "Person \(item)"))
//                                    RuleMark(y: .value("Long Stay", 14))
//                                        .lineStyle(StrokeStyle(dash: [15.0, 5.0]))
//                                        .foregroundStyle(.red
//                                        )
//                                        .annotation(position: .top, alignment: .leading, overflowResolution: .init(x: .fit(to: .chart), y: .disabled)){
//                                            Text("Lengthy Stay")
//                                                .textCase(.uppercase)
//                                                .font(.headline)
//                                                .foregroundStyle(.red)
//                                        }
//                                }


//.annotation(position: .top, alignment: .leading){
//    Text("Lengthy Stay")
//        .textCase(.uppercase)
//        .font(.headline)
//        .foregroundStyle(.red)
//}
