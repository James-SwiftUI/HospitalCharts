
import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject{
    @Published var routes = [Route]()
    
    
    func push(to screen: Route){
        routes.append(screen)
    }
    
    
    func reset(){
        routes = []
    }
    
    func goBack() {
        _ = routes.popLast()
    }
    
    
}
