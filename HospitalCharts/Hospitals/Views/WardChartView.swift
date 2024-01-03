import SwiftUI

struct WardChartView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var wardName: String
    @Binding var totalBeds: Int
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                
                Section{
                    Text("Ward Charts 📊📈")
                        .font(.largeTitle)
                    Text(wardName)
                    Text("\(totalBeds) Beds")
                    
                }header: {
                   Text(wardName)
                    
                        
                }
            }
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
    
    static func generateData() -> [PatientLog]{
        var wards = [PatientLog]()
        let range = 1...7
    
        
        
        for day in range{
            
            let patientsIn = Int.random(in: 1...5)
            let patientsOut = Int.random(in: 2...7)
            
            let wardItemIn = PatientLog(days: day, numderOfPatiens: patientsIn, action: .patientsIn)
            wards.append(wardItemIn)
            
            let wardItemOut = PatientLog(days: day, numderOfPatiens: patientsOut, action: .patientsOut)
            wards.append(wardItemOut)
        }
        
        return wards
    }
}

#Preview {
    WardChartView(wardName: .constant("WARD 1"), totalBeds: .constant(10))
}
