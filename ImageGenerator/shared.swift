//
//  shared.swift
//  iosApp
//
//  Created by Nurgun Nalyiakhov on 25.05.2023.
//

import Foundation
import UIKit

let isIpad = UIDevice.current.userInterfaceIdiom == .pad
let defaultPadding: CGFloat = 5

let favoritesKey = "favoriteImages"
var sharedfavoriteImages: [String] {
    get {
        return UserDefaults.standard.array(forKey: favoritesKey) as? [String] ?? [String]()
    }
    set(value) {
        UserDefaults.standard.set(value, forKey: favoritesKey)
    }
}

var statusBarHeight: CGFloat {
    var statusBarHeight: CGFloat = 0
    if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
    }
    return statusBarHeight
}

var bottomBarHeight: CGFloat {
    guard let root = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
        return 0
    }
    return root.safeAreaInsets.bottom
}

func saveImageToDisk(fileName: String, image: UIImage) -> Bool {
    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return false }

    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    guard let data = image.jpegData(compressionQuality: 1) else { return false }

    if FileManager.default.fileExists(atPath: fileURL.path) {
        do {
            try FileManager.default.removeItem(atPath: fileURL.path)
        } catch {}
    }

    do {
        try data.write(to: fileURL)
        return true
    } catch {
        return false
    }
}

func loadImageFromDisk(fileName: String) -> UIImage? {
    let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

    let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
    let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

    if let dirPath = paths.first {
        let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
        let image = UIImage(contentsOfFile: imageUrl.path)
        return image
    }

    return nil
}

func removeImageFromDisk(fileName: String) {
    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    if FileManager.default.fileExists(atPath: fileURL.path) {
        do {
            try FileManager.default.removeItem(atPath: fileURL.path)
        } catch {}
    }
}
