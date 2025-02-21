//
//  EqSmallCell.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct EqSmallCell: View {
    @Binding var equipment: Equipment
        
    @State private var showPicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var completion: () -> ()
    
    var body: some View {
        Rectangle()
            .frame(width: size().width - 40, height: 100)
            .cornerRadius(12)
            .foregroundStyle(.blueCard)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.grayCorner)
            }
            .overlay {
                HStack {
                    if let image = UIImage(named: equipment.name) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 60)
                    } else if let imageToShow = equipment.image {
                        Image(uiImage: imageToShow)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipped()
                            .cornerRadius(8)
                    } else {
                        HStack {
                            Button {
                                sourceType = .photoLibrary
                                showPicker.toggle()
                            } label: {
                                Rectangle()
                                    .foregroundStyle(.white)
                                    .cornerRadius(8)
                                    .frame(width: 60, height: 60)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(.purpleButton)
                                    }
                                    .overlay {
                                        Image(systemName: "photo.on.rectangle.angled")
                                            .font(.system(size: 24, weight: .regular))
                                            .foregroundStyle(.greenButton)
                                    }
                            }
                            
                            Button {
                                sourceType = .camera
                                showPicker.toggle()
                            } label: {
                                Rectangle()
                                    .foregroundStyle(.white)
                                    .cornerRadius(8)
                                    .frame(width: 60, height: 60)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(lineWidth: 2)
                                            .foregroundStyle(.purpleButton)
                                    }
                                    .overlay {
                                        Image(systemName: "camera")
                                            .font(.system(size: 24, weight: .regular))
                                            .foregroundStyle(.greenButton)
                                    }
                            }
                        }
                       
                    }
                    
                    
                    
                    Spacer()
                    if equipment.name.isEmpty {
                        TextField("", text: $equipment.name, prompt: Text("New Equipment"))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .tint(.white)
                            .font(.system(size: 20, weight: .bold))

                    } else {
                        Text(equipment.name)
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                    
                    
                    Spacer()
                    
                    Button {
                        completion()
                    } label: {
                        Image(systemName: "trash")
                            .foregroundStyle(.purpleButton)
                    }
                }
                .padding(.horizontal)
            }
     
            .sheet(isPresented: $showPicker) {
                ImagePicker(sourceType: sourceType, selectedImage: $equipment.image)
                    .ignoresSafeArea()
            }
    }
}

//#Preview {
//    EqSmallCell(equipment: Equipment(id: UUID(), name: "")){}
//        .preferredColorScheme(.dark)
//}



struct ImagePicker: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var selectedImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
