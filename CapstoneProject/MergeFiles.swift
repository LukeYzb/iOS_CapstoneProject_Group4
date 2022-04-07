//
//  MergeFiles.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-04-07.
//

import Foundation

//data pass
var dataUrl:URL{
    //set pass
    var url=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    //create folder: middle pass
    //url.appendPathComponent("folder1/folder2")
    //try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)//'try?' is like do try catch, but allows running even when error occurs. 'true' means create middle pass of 'middle pass: folder1/folder2': folder1
    
    //create file
    url.appendPathComponent("hello.txt")
    
    //show pass
    //print(url)
    return url
}
var dataUrl2:URL{
    //set pass
    let url=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    return url
}

//show data pass instruction
func dataInstruction(){
    print("Please open 'Finder', press Command+Shift+G, input \(dataUrl2), and find your file.")
}

//read data
func readData(){
    do{
        let str=try String(contentsOf: dataUrl, encoding: .utf8)
        print("Read success: \(str)")
    }catch{
        print("Read Error: \(error)")
    }
}

//save data
func saveData(){
    do{
        try "Hello, world!".write(to: dataUrl, atomically: false, encoding: .utf8)
        print("Write success")
    }catch{
        print("Save Error: \(error)")
    }
}

//delete data
func deleteData(){
    do{
        try FileManager.default.removeItem(at: dataUrl)
        print("Delete success")
    }catch{
        print("Delete Error: \(error)")
    }
}

//check whether file exist
func checkExist()->Bool{
    if FileManager.default.fileExists(atPath: dataUrl.path){
        return true
    }else{
        return false
    }
}

func dataContainerDirectory(){
    let document=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    print("document: \(document)")
    print()
    
    let support=FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
    print("support: \(support)")
    print()
    
    let cache=FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    print("cache: \(cache)")
    print()
    
    let temp = FileManager.default.temporaryDirectory
    print("temp: \(temp)")
    print()
    
}
