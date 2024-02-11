import SwiftUI

struct AandE: View {
    
    @State private var year: String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                Picker("", selection: $year){
                    Text("2020")
                        .tag("2020")
                    Text("2021")
                        .tag("2021")
                    Text("2022")
                        .tag("2022")
                    Text("2023")
                        .tag("2023")
                }
                .pickerStyle(.palette)
                Text("A & E ‼️  \(year)")
                    .font(.title)
                LineChartView()
                    .padding(.horizontal, 6)
                Spacer()
            }
            .navigationTitle("A & E 🚑")
        }
        
    }
}

#Preview {
    AandE()
}
