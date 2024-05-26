import Foundation



let monthSelection = ["Mar", "Apr", "May"]


let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]


let attendanceTypes: [AttendanceType] = [.ambulance, .police, .walkin, .helicopter]


struct PatientsSeen: Identifiable{
    var id = UUID()
    var total: Int
    var department: Department
}
