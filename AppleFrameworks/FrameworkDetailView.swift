import SwiftUI

struct FrameworkDetailView : View {
    
    var framework : Framework
    @Binding var isShowingDeatailView : Bool
    @State private var isShowingSafariView = false
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button {
                    isShowingDeatailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 48, height: 48)
                }
            }
            .padding()
            
            Spacer()
            FrameWorkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                Text("Learn More")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 280, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString)!)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDeatailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
