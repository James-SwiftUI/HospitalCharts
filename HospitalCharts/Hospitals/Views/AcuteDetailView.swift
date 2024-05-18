import SwiftUI

struct AcuteDetailView: View {
    
    @State private var showWardCharts = false
    let acute: Acute
    @State private var wardName: String = ""
    @State private var wardTotal: Int = 0
    
    
    
    var body: some View {
        List{
            VStack{
                Text("Hospital Total Beds: **\(acute.totalBeds)**")
            }
        
            ForEach(acute.wards.sorted(by: { $0.key < $1.key }), id: \.key){ name, total in
                Button{
                    wardName = name
                    wardTotal = total
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
            AcuteWardChartView(wardName: $wardName, wardTotal: $wardTotal)
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
                    .foregroundStyle(.secondary)
            }
        }
    }
}
