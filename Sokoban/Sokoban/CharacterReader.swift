////
////  CharacterReader.swift
////  Sokoban
////
////  Created by Erzhan Kasymov on 23/9/22.
////
//
import Foundation
import UIKit

public class CharacterReader {
    let encoding : String.Encoding
    let chunkSize : Int
    
    var fileHandle : FileHandle!
    let buffer : NSMutableData!
    var stored : [Character] = Array()
    var stored_idx: Int = 0
    var stored_cnt: Int = 0
    let delimData : NSData!
    var atEof : Bool = false
    
    init?(path: String, delimiter: String = "\n", encoding: String.Encoding = String.Encoding.utf8, chunkSize : Int = 4096) {
        self.chunkSize = chunkSize
        self.encoding = encoding
        
        if let fileHandle = FileHandle(forReadingAtPath: path),
           let delimData = delimiter.data(using: encoding),
           let buffer = NSMutableData(capacity: chunkSize)
        {
            self.fileHandle = fileHandle
            self.delimData = delimData as NSData?
            self.buffer = buffer
            self.stored = Array()
            self.stored_idx = 0
        } else {
            self.fileHandle = nil
            self.delimData = nil
            self.buffer = nil
            self.stored = Array()
            self.stored_idx = 0
            return nil
        }
    }
    
    deinit {
        self.close()
    }
    
    
    /// Return next character, or nil on EOF.
    func nextChar() -> Character? {
        //precondition(fileHandle != nil, "Attempt to read from closed file")
        
        if atEof {
            return nil
        }
        
        if stored_cnt > (stored_idx + 1) {
            stored_idx += 1
            return stored[stored_idx]
        }
        
        let tmpData = fileHandle.readData(ofLength: (chunkSize))
        if tmpData.count == 0 {
            atEof = true
            return nil
        }
        
        if let s = NSString(data: tmpData, encoding: encoding.rawValue) as String? {
            stored = s.map { $0 }
            stored_idx = 0
            stored_cnt = stored.count
        }
        return stored[0];
    }
    
    /// Start reading from the beginning of file.
    func rewind() -> Void {
        fileHandle.seek(toFileOffset: 0)
        buffer.length = 0
        stored_cnt = 0
        atEof = false
    }
    
    /// Close the underlying file. No reading must be done after calling this method.
    func close() -> Void {
        fileHandle?.closeFile()
        fileHandle = nil
    }
}
