import SwiftUI

struct TrustHospitalsView: View {
    var body: some View {
        NavigationStack{
            List{
                Section{
                    Text("Acute Hospital 1")
                    Text("Acute Hospital 2")
                    Text("Acute Hospital 3")
                }header: {
                     Text("Acute Hospitals - Total Beds: 500")
                }
                
                Section{
                    Text("Community Hospital 1")
                    Text("Community Hospital 2")
                    Text("Community Hospital 3")
                    Text("Community Hospital 4")
                    Text("Community Hospital 5")
                    Text("Community Hospital 6")
                    Text("Community Hospital 7")
                }header: {
                    Text("Community Hospitals - Total Beds: 80")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Trust Hospitals 🏥")
        }
    }
}

#Preview {
    TrustHospitalsView()
}
