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

//modify reference number and merge files
func merge(str1:String,str2:String)->String{
    //result
    var result:String = ""
    
    if(str1 != "" && str2 != ""){
        //modify reference number sequence
        //the second paper string
        var str2a = str2
        var str2b = str2
        
        //find the last ref num in the first paper
        let i1 = str1.lastIndex(of: "[")
        //if there is ref num in the first paper, modify ref num in the second one
        if(i1 != nil){
            //move the index back for 1
            let i1a = str1.index(i1!, offsetBy: 1)
            let i2 = str1.lastIndex(of: "]")
            let num1a = str1[i1a..<i2!]
            let num1:Int = Int(num1a)!
            
            //modify the ref num in the second paper
            //get the frequency of "["
            var numCount:Int = 0
            for item in str2{
                if(item == "["){
                    numCount+=1
                }
                
            }
            //print(numCount)
            
            //if there is ref num in the second paper, modify it
            if(numCount > 0){
                str2a = ""
                for _ in 0..<numCount{
                    let i5 = str2b.firstIndex(of: "[")
                    let i5a = str2b.index(i5!, offsetBy: 1)
                    let i6 = str2b.firstIndex(of: "]")
                    let num3a = str2b[i5a..<i6!]
                    var num3:Int = Int(num3a)!
                    num3+=num1
                    
                    str2a+=str2b[str2b.startIndex..<i5a]
                    str2a+=String(num3)+"]"
                    
                    str2b.removeSubrange(str2b.startIndex...i6!)
                }
                str2a+=str2b
                //print(str2a)
            }
        }
        
        
        
        //merge the file
        //split
        let arr1:[Substring] = str1.split(separator: "\n")
        //change substring array to string array
        var arr1a:[String] = []
        for item in arr1 {
            arr1a.append("\(item) \n")
        }
        
        //split
        let arr2:[Substring] = str2a.split(separator: "\n")
        //change substring array to string array
        var arr2a:[String] = []
        for item in arr2 {
            arr2a.append("\(item) \n")
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
                    //the index of same question in str1 array
                    arr3[0].append(idx1)
                    //the index of same question in str2 array
                    arr3[1].append(idx2)
                }
            }
        }
        
        //merge the file
        var idx1a:Int=0
        var idx1b:Int=0
        for (idx,_) in arr3[0].enumerated(){
            if(idx > 0){
                //add question and answers for this 'same question' in str1 array
                for idx1 in arr3[0][idx-1]..<arr3[0][idx] {
                    result+=arr1a[idx1]
                    //the index of the last 'same question', which is used later
                    idx1a=arr3[0][idx]
                }
                //add question and answers for this 'same question' in str2 array
                for idx2 in arr3[1][idx-1]..<arr3[1][idx]{
                    result+=arr2a[idx2]
                    //the index of the last 'same question', which is used later
                    idx1b=arr3[1][idx]
                }
            }
        }
        
        var arr1A:[String] = []
        var arr2A:[String] = []
        
        //get the left part with the index of the last 'same question'
        if(arr1a.count>0){
            for idx1 in idx1a...arr1a.count-1 {
                arr1A.append(arr1a[idx1])
            }
        }
        else{
            arr1A.append(arr1a[0])
        }
        if(arr2a.count>0){
            for idx2 in idx1b...arr2a.count-1 {
                arr2A.append(arr2a[idx2])
            }
        }
        else{
            arr2A.append(arr2a[0])
        }
        
        for item in arr1A{
            result+=item
        }
        for item in arr2A{
            result+=item
        }
    }
    else if(str1 == ""){
        result = str2
    }
    else if(str2 == ""){
        result = str1
    }
    else{
        result = ""
    }
    
    //show merge result
    //print(result)
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
func dataInstruction()->String{
    var dataUrl2a:String = dataUrl2.absoluteString
    
    //delete first 5 letters
    let range = dataUrl2a.startIndex...(dataUrl2a.index(dataUrl2a.startIndex, offsetBy: 4))
    dataUrl2a.removeSubrange(range)
    
    return "Please open 'Finder', press Command+Shift+G, input \(dataUrl2a), and find your file."
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
