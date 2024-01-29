import SwiftUI

struct HospitalHeaderView: View {
    
    let name: String
    let totalBeds: Int
    
    
    var body: some View {
        VStack(spacing: 18) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title)
                    Label("Total Beds \(totalBeds)", systemImage: "bed.double.circle.fill")
                }
                Spacer()
            }
            .font(.title3.bold())
            .padding(10)
            .padding(.horizontal, 10)
            
            .foregroundStyle(.white)
            
        }
        .frame(maxWidth: .infinity)
        .background(.teal.gradient)
        //.clipShape(.rect(cornerRadius: 25))
        .shadow(color: .black.opacity(0.2), radius: 2)

    }
}

#Preview {
    HospitalHeaderView(name: "Acute", totalBeds: 2500)
}
