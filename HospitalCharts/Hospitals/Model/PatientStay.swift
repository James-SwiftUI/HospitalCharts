//Used in communtiy bed views to disply patient information in the bed

import Foundation


struct PatientStay: Identifiable{
    let id = UUID()
    let bedName: String
    let nightsStayed: Int
    let patientName: String
}
