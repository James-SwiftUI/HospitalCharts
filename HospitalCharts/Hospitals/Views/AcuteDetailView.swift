import SwiftUI

struct AcuteDetailView: View {
    
    @State private var showWardCharts = false
    let acute: Acute
    @State private var totalBeds: Int = 0
    @State private var wardName: String = ""
    
    var body: some View {
        List{
        
            ForEach(acute.wards.sorted(by: { $0.key < $1.key }), id: \.key){ name, total in
                Button{
                    totalBeds = total
                    wardName = name
                    showWardCharts.toggle()
                }label: {
                    WardLink(name: name, total: total)
                        .foregroundColor(.black)
                }
            
            
            }
        }
        .navigationTitle(acute.name)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showWardCharts){
            WardChartView(wardName: $wardName, totalBeds: $totalBeds)
        }
    }
}

#Preview {
    AcuteDetailView(acute: .example)
}


struct WardLink: View {

    let name: String
    let total: Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text(name)
                .font(.headline)
            LabeledContent("\(total) beds"){
                Image(systemName: "bed.double.fill")
            }
        }
    }
}
