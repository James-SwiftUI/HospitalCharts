//
//import SwiftUI
//import Charts
//
//struct SwiftUIView: View {
//    
//    @Environment(\.dismiss) var dismiss
//    
//    @Binding var wardName: String
//    @Binding var beds: Int
//    
//    
//    var body: some View {
//        NavigationStack{
//                Chart{
//                    ScrollView(.horizontal){
//                        ForEach(1...beds, id: \.self){ item in
//                            
//                            let randomNumber = Int.random(in: 1...3)
//                            
//                            BarMark(x: .value("Patient", "Bed \(item )"), y: .value("Stay Days", randomNumber * item))
//                                .foregroundStyle(by: .value("Patient", "Person \(item)"))
//                            RuleMark(y: .value("Long Stay", 14))
//                                .lineStyle(StrokeStyle(dash: [15.0, 5.0]))
//                                .foregroundStyle(.red
//                                )
//                                .annotation(position: .top, alignment: .leading){
//                                    Text("Lengthy Stay")
//                                        .textCase(.uppercase)
//                                        .font(.headline)
//                                        .foregroundStyle(.red)
//                                }
//                        }
//                    }
//                    
//                }
//                
//                
//            
//            
//        }
//    }
//}
//
//#Preview {
//    SwiftUIView()
//}
