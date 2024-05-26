import SwiftUI

struct TrustHospitalsView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
           
                
                List{
                    Section{
                        ForEach(MockData.acuteHospitals){ hospital in
                            NavigationLink(value: hospital){
                                    Text(hospital.name)
                                       
                            }
                        }
                    }header: {
                        HospitalHeaderView(name: "Acute", totalBeds: calculateTotalBeds(items: MockData.acuteHospitals))
                            .padding(.horizontal, -20)
                    }
                    Section{
                        ForEach(MockData.communityHospitals){ hospital in
                                NavigationLink(value: hospital){
                                    Text(hospital.name)
                                }
                                
                            }
                        
                    }header: {
                        HospitalHeaderView(name: "Community", totalBeds: calculateTotalBeds(items: MockData.communityHospitals))
                            .padding(.horizontal, -20)
                    }
                    
                }
                .listStyle(.plain)
                .navigationDestination(for: Acute.self){ hospital in
                        AcuteDetailView(acute: hospital)
                }
                .navigationDestination(for: Community.self){ hospital in
                    CommunityDetailView(community: hospital)
                }
            .navigationTitle("Trust Hospitals 🏥")
        }
    }
    
    func calculateTotalBeds(items: [any HospitalItem])-> Int{
        var total = 0
        for item in items{
            total += item.totalBeds
        }
        return total
    }
}

#Preview {
    TrustHospitalsView()
}
