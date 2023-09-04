import SwiftUI

struct FrameworkDetailView : View {
    
    @ObservedObject var viewModel : FrameworkDetailViewModel
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button {
                    viewModel.isShowingDetailView.wrappedValue = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 48, height: 48)
                }
            }
            .padding()
            
            Spacer()
            FrameWorkTitleView(framework:  viewModel.framework)
            Text( viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: URL(string:  viewModel.framework.urlString)!) {
                Label {
                    Text("Learn More")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(width: 280, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                } icon: {}
            }
           /* Button {
                viewModel.isShowingSafariView = true
            } label: {
                Text("Learn More")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 280, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            */
        }
        // .sheet(isPresented: $viewModel.isShowingSafariView) {
        //    SafariView(url: URL(string:  viewModel.framework.urlString)!)
       //  }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework, isShowingDetailView: .constant(false)))
            .preferredColorScheme(.dark)
    }
}
