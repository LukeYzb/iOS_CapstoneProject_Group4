//
//  MergeFiles.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-04-07.
//

import Foundation

//files
func file1(str:String)->String{
    return str
}
func file2(str:String)->String{
    return str
}

//merge files
func merge(str1:String,str2:String)->String{
    //merge result
    var result:String = ""
    
    //split
    let arr1:[Substring] = str1.split(separator: "\n")
    //change substring array to string array
    var arr1a:[String] = []
    for item in arr1 {
        arr1a.append("\(item)")
    }
    
    //split
    let arr2:[Substring] = str2.split(separator: "\n")
    //change substring array to string array
    var arr2a:[String] = []
    for item in arr2 {
        arr2a.append("\(item)")
    }
    
    //2-dimension array arr3, store arr1a index and arr2a index
    var arr3:Array = [[Int]]();
    arr3 = [
        [0],
        [0]
    ]
    //when item1 == item2, it must be the question content
    for (idx1,item1) in arr1a.enumerated(){
        for (idx2,item2) in arr2a.enumerated(){
            if(item1==item2){
                //arr3[index][0]=arr1a.firstIndex(of: item1) ?? <#default value#>
                //arr3[index][1]=arr2a.firstIndex(of: item2) ?? <#default value#>
                arr3[0].append(idx1)
                arr3[1].append(idx2)
            }
        }
    }
    
    //merge the file
    var idx1a:Int=0
    var idx1b:Int=0
    for (idx,_) in arr3[0].enumerated(){
        if(idx > 0){
            for idx1 in arr3[0][idx-1]..<arr3[0][idx] {
                result+=arr1a[idx1]
                idx1a=arr3[0][idx]
            }
            for idx2 in arr3[1][idx-1]..<arr3[1][idx]{
                result+=arr2a[idx2]
                idx1b=arr3[1][idx]
            }
        }
    }
    var arr1A:[String] = []
    var arr2A:[String] = []
    for idx1 in idx1a...arr1a.count-1 {
        arr1A.append(arr1a[idx1])
    }
    for idx2 in idx1b...arr2a.count-1 {
        arr2A.append(arr2a[idx2])
    }
    for item in arr1A{
        result+=item
    }
    for item in arr2A{
        result+=item
    }
    
    //show merge result
    print(result)
    return result
}

//data pass
var dataUrl:URL{
    //set pass
    var url=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    //create folder: middle pass
    //url.appendPathComponent("folder1/folder2")
    //try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)//'try?' is like do try catch, but allows running even when error occurs. 'true' means create middle pass of 'middle pass: folder1/folder2': folder1
    
    //create file
    url.appendPathComponent("list.txt")
    
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
    var dataUrl2a:String = dataUrl2.absoluteString
    
    //delete first 5 letters
    let range = dataUrl2a.startIndex...(dataUrl2a.index(dataUrl2a.startIndex, offsetBy: 4))
    dataUrl2a.removeSubrange(range)
    
    print("Please open 'Finder', press Command+Shift+G, input \(dataUrl2a), and find your file.")
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
func saveData(str1:String,str2:String){
    do{
        try merge(str1: str1,str2: str2).write(to: dataUrl, atomically: false, encoding: .utf8)
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
