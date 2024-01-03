import SwiftUI

struct TrustHospitalsView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
           
                
                List{
                    Section{
                        ForEach(acuteHospitals){ hospital in
                            NavigationLink(value: hospital){
                                    Text(hospital.name)
                                       
                            }
                        }
                    }header: {
                        Text("Acute Hospitals Total Beds: 500")
                    }
                    Section{
                            ForEach(1...10, id: \.self){ item in
                                NavigationLink(value: item){
                                    Text("Community Hospital \(item)")
                                }
                                
                            }
                        
                    }header: {
                        Text("Community Hospitals - Total Beds: 80")
                    }
                    
                }
                .listStyle(.plain)
                .navigationDestination(for: Acute.self){ hospital in
                        Text(hospital.name)
                }
                .navigationDestination(for: Int.self){ item in
                    Text("🏥 \(item)")
                }
                                        
                
                
                
                
            
            

            .navigationTitle("Trust Hospitals 🏥")
        }
    }
}

#Preview {
    TrustHospitalsView()
}
