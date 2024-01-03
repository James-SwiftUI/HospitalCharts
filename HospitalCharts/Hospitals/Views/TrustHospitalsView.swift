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
                            ForEach(communityHospitals){ hospital in
                                NavigationLink(value: hospital){
                                    Text(hospital.name)
                                }
                                
                            }
                        
                    }header: {
                        Text("Community Hospitals - Total Beds: 80")
                    }
                    
                }
                .listStyle(.plain)
                .navigationDestination(for: Acute.self){ hospital in
                        AcuteDetailView(acute: hospital)
                }
                .navigationDestination(for: Community.self){ hospital in
                    CommunityDetailView()
                }
                                        
                
                
                
                
            
            

            .navigationTitle("Trust Hospitals 🏥")
        }
    }
}

#Preview {
    TrustHospitalsView()
}
