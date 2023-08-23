import SwiftUI


// if we are not going to subclass our clas make it final
final class FrameworkGridViewModel: ObservableObject {
    var selectedFramework : Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
}
