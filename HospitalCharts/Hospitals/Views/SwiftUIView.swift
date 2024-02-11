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


//    var patientAttendance: [Attendance] = [
//        .init(month: "Jan", attendence: .ambulance, total: 250, color: AttendanceType.ambulance.colorName),
//        .init(month: "Jan", attendence: .helicopter, total: 23, color: AttendanceType.helicopter.colorName),
//        .init(month: "Jan",attendence: .police, total: 45, color: AttendanceType.police.colorName),
//        .init(month: "Jan", attendence: .walkin, total: 320, color: AttendanceType.walkin.colorName),
//
//
//        .init(month: "Feb", attendence: .ambulance, total: 370, color:
//                AttendanceType.ambulance.colorName),
//        .init(month: "Feb", attendence: .helicopter, total: 55, color: AttendanceType.helicopter.colorName),
//        .init(month: "Feb",attendence: .police, total: 65, color: AttendanceType.police.colorName),
//        .init(month: "Feb", attendence: .walkin, total: 210, color: AttendanceType.walkin.colorName),
//
//        .init(month: "Mar", attendence: .ambulance, total: 350, color: AttendanceType.ambulance.colorName),
//        .init(month: "Mar", attendence: .helicopter, total: 32, color: AttendanceType.helicopter.colorName),
//        .init(month: "Mar",attendence: .police, total: 55, color: AttendanceType.police.colorName),
//        .init(month: "Mar", attendence: .walkin, total: 420, color: AttendanceType.walkin.colorName)
//
//
//    ]
