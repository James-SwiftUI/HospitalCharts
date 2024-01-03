import Foundation
import SwiftUI

protocol HospitalItem: Identifiable, Hashable{
    var id: String { get }
    var name: String { get }
    var description: String { get }
    var wards: [String:Int] { get }
    var totalBeds: Int { get }
}
