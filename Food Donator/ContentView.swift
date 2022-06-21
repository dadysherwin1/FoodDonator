/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct ContentView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary

    @ObservedObject var classifier: ImageClassifier

//    var classifier = Classifier()
    
    var body: some View {
        VStack {
            TabView {
                VStack{
                    Text("Home Tab")
                    Button("Launch", action: {})
                    Button("Locations", action: {})
                    Button(action: {
                        print("button pressed")

                        }) {
                            Image(systemName: "house.fill")
                            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        }

                }
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    
                VStack{
                    HStack{
                        Image(systemName: "photo")
                            .onTapGesture {
                                isPresenting = true
                            }
                        Image(systemName: "camera")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                    
                    Rectangle()
                        .strokeBorder()
                        .foregroundColor(.blue)
                        .overlay(
                            Group {
                              if uiImage != nil {
                                Image(uiImage: uiImage!)
                                  .resizable()
                                  .scaledToFit()
                              }
                            }
                          )
                    
                    VStack{
                        Button(action: {
                            if uiImage != nil {
                                classifier.detect(uiImage: uiImage!)
                            }
                        }) {
                            Image(systemName: "bolt.fill")
                                .foregroundColor(.orange)
                                .font(.title)
                        }
                        
                        
                        Group {
                            if let imageClass = classifier.imageClass {
                                HStack{
                                    Text("Image categories:")
                                        .font(.caption)
                                    Text(imageClass)
                                        .bold()
                                }
                            } else {
                                HStack{
                                    Text("Image categories: NA")
                                        .font(.caption)
                                }
                            }
                        }
                        .font(.subheadline)
                        .padding()
                            
                        }
                    }

                }
                    
                .sheet(isPresented: $isPresenting){
                        ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                            .onDisappear{
                                if uiImage != nil {
                                    classifier.detect(uiImage: uiImage!)
                                }
                            }
                        
                    }
                .padding()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Camera")
                }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(classifier: ImageClassifier())
    }
}

