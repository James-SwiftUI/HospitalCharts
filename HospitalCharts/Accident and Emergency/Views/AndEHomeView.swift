import SwiftUI

import Charts

struct AndEHomeView: View {
    
    let hostpitalType: String
    
    @State private var hospitalChoice = 0
    
    var body: some View {
        NavigationStack{
            List{
                Section {
                    VStack{
                        Picker("Hospital Selection", selection: $hospitalChoice){
                            Text("Red Robin")
                                .tag(0)
                            Text("Pheasant Hill")
                                .tag(1)
                        }
                        .pickerStyle(.segmented)
                        HStack(alignment: .top){
                            VStack(alignment: .center){
                                Text("Under **4 hours**")
                                    .font(.title3)
                                Spacer()
                                IndicatorView(percent: hospitalChoice == 0 ? 74 : 63, color: .green)
                            }
                            Spacer()
                            VStack{
                                Text("Over **4 Hours**")
                                    .font(.title3)
                                Spacer()
                                IndicatorView(percent: hospitalChoice == 0 ? 26 : 37, color: .red)
                            }
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    VStack(alignment: .leading, spacing: 20){
                        NavigationLink{
                            AandEAttendanceCurrentView()
                        }label: {
                            
                            if hospitalChoice == 0{
                                LabeledContent("Attendence has **increased** by **18%** in the **past hour**"){
                                    Image(systemName: "arrow.up.right")
                                        .foregroundStyle(.green)
                                        .imageScale(.large)
                                        .fontWeight(.black)
                                }
                            }else{
                                LabeledContent("Attendence has **decreased** by **12%** in the **past hour**"){
                                    Image(systemName: "arrow.down.right")
                                        .foregroundStyle(.red)
                                        .imageScale(.large)
                                        .fontWeight(.black)
                                }
                            }
                        }
                        ThumbnailAttendanceView()
                    }
                    
                }header: {
                    Text("Overview")
                }footer: {
                    Text("View Attendences Over Time")
                }
                
                Section{
                    
                    NavigationLink{
                        AandEAttendanceByYearandMonth(isThumbalView: false, frameHeight: 420.0)
                    }label: {
                        VStack(alignment: .leading){
                            AandEAttendanceByYearandMonth(isThumbalView: true, frameHeight: 320.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(.gray.opacity(0.3))
                                    
                                )
                                .chartXAxis(.hidden)
                                .chartYAxis(.hidden)
                            Text("View historical attendance by month")
                                .font(.caption)
                                .padding(.horizontal, 12)
                                .padding(.top, 12)
                        }
                        .padding()
                    }
                    NavigationLink{
                        ArrivalAttendanceBarChartView(showTheLegend: true, frameHeight: 400)
                            
                    }label: {
                        VStack(alignment: .leading){
                            ArrivalAttendanceBarChartView(showTheLegend: false, frameHeight: 200)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(.gray.opacity(0.3))
                                    
                                )
                                .chartXAxis{}
                                .chartYAxis{}
                            Text("View mode of arrival")
                                .font(.caption)
                                .padding(.horizontal, 12)
                                .padding(.top, 12)
                        }
                        .padding()
                    }
                }header: {
                    Text("Historical Attendance")
                }
                
                
            }
            
        }
        
        
    }
    
    
}

#Preview {
    AndEHomeView(hostpitalType: "Acute")
}





struct IndicatorView: View {
    
    let percent: Int
    let color: Color
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5))
                .frame(width: 60, height: 60)
            Circle()
            
                .trim(from: 0.0, to: CGFloat(Double(min(percent, 100)) / 100.0))
            
                .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 60, height: 60)
                .foregroundStyle(color.gradient)
            Text("\(percent)%")
                .font(.caption)
                .fontWeight(.black)
        }
    }
}



    //                        Picker("Hospital Selection", selection: $hospitalChoice){
    //                            Text("Red Robin")
    //                                .tag(0)
    //
    //                            Text("Pheasant Hill")
    //                                .tag(1)
    //                        }
    //                        .pickerStyle(.segmented)



//switch hostpitalType{
//case "Acute":
//    
//    VStack(alignment: .leading){
//        Text("Trust Acute Hosptials")
//        Text("2 hospitals are in are trust")
//        Text("Red Robin Hospital")
//    }
//    .padding(.horizontal)
//    
//default:
//    Text("No View here")
//}
//Image(.communityHospital)
//    .resizable()
//    .aspectRatio(contentMode: .fit)
//    .frame(width: 400)
//    .cornerRadius(12)
//
//Spacer()
