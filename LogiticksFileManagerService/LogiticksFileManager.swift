//
//  LogiticksFileManager.swift
//  LogiticksFileManagerService
//
//  Created by Logiticks LLP on 21/05/21.
//
public struct LogiticksFileManager {
    public let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    //Add default path
    
    public func isFileExist(atPath:String) -> Bool{
        return FileManager.default.fileExists(atPath: atPath)
    }
    public func isFileExist(folderPath:URL,fileName:String) -> Bool{
        let filePath = appendPath(folderPath: folderPath, fileName: fileName)
        return isFileExist(atPath: filePath.path)
    }
    public func appendPath(folderPath:URL, fileName:String) -> URL{
        return folderPath.appendingPathComponent(fileName)
    }
    public func appendPathToDocumentDirectory(folderName:String) -> URL{
        return documentDirectory.appendingPathComponent(folderName)
    }
    public func getFilePathURLString(folderPath:URL,fileName:String) -> String{
        let filePath = appendPath(folderPath: folderPath, fileName: fileName)
        return getFilePathURLString(folderPath: filePath)
    }
    public func getFilePathURLString(folderPath:URL) -> String{
        return folderPath.path
    }
    public func createDirectory(folderPath:URL){
        do {
            try FileManager.default.createDirectory(atPath: folderPath.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
        }
    }
    
    public func getFilesFromFolder(folderPath:URL,type:String)-> [String]{
        do {
            let fileArray = try FileManager.default.contentsOfDirectory(atPath: folderPath.path)
            if fileArray.count > 0{
                return fileArray.filter { $0.contains(type) }
            }else{
                return [String]()
            }
        } catch{
            return [String]()
        }
    }
    
    public func removeFile(folderPath:URL,fileName:String){
        let filePath = appendPath(folderPath: folderPath, fileName: fileName)
        if isFileExist(atPath: filePath.path){
            removeFilePath(atPath: filePath.path)
        }
    }
    public func removeFilePath(atPath:String){
        do {
            try FileManager.default.removeItem(atPath: atPath)
        }catch {
        }
    }
    public func getContentOfFile(from filePath:String, encoding:String.Encoding)-> String{
        do {
            let contents = try String(contentsOfFile: filePath, encoding: encoding)
            return contents
        } catch{
            return ""
        }
    }
}
