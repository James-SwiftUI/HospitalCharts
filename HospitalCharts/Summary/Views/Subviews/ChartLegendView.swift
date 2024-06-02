import SwiftUI

struct ChartLegendView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            HStack{
                
                Spacer()
            }
            ForEach(MockData.allPatientsSeen){ item in
                Label(item.department.rawValue, systemImage: "square.fill")
                    .foregroundStyle(item.color)
            }
            .padding(.horizontal, 20)
    
            
        }
    }
}

#Preview {
    ChartLegendView()
}
