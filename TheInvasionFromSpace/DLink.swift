//
//  DLink.swift
//  TheInvasionFromSpace
//
//  Created by JH on 6/23/17.
//  Copyright © 2017 Sparrowhawk1984. All rights reserved.
//

import Foundation

class DLink {
    internal var pPrev: DLink?
    internal var pNext: DLink?
    
    init() {
        self.pPrev = nil
        self.pNext = nil
    }
    
    func dumpNode() {
        debugPrint("Dump not implemented!")
        assert(true, "Not implemented")
    }
    
    func compareEqual(pNode: DLink?) -> Bool {
        debugPrint("compare equal not implemented!")
        assert(true, "Not implemented")
        return false
    }
    
    func compareOrder(pNode: DLink?) -> Bool {
        debugPrint("compare order not implemented!")
        assert(true, "Not implemented")
        return false
    }
    
    func setNext(pNode: DLink?) {
        self.pNext = pNode
    }
    
    func getNext() -> DLink? {
        return self.pNext
    }
    
    func setPrev(pNode: DLink?) {
        self.pPrev = pNode
    }
    
    func getPrev() -> DLink? {
        return self.pPrev
    }
 
    func addToFront(pHead: DLink?, pNode: DLink) -> DLink {
        pNode.pPrev = nil
        if pHead == nil {
            pNode.pNext = nil
            return pNode
        }
        pNode.pNext = pHead
        pHead?.pPrev = pNode
        return pNode
    }
    
    func addOrdered(pHead: DLink?, pNode: DLink) -> DLink? {
        if pHead == nil {
            pNode.pPrev = nil
            pNode.pNext = nil
            return pNode
        }
        if pNode.compareOrder(pNode: pHead) {
            pNode.pPrev = nil
            pNode.pNext = pHead
            pHead?.pPrev = pNode
            return pNode
        }
        var prevNode = pHead
        var currNode = pHead?.getNext()
        var inserted = false
        while !inserted {
            if currNode != nil && !pNode.compareOrder(pNode: currNode) {
                prevNode = currNode
                currNode = currNode?.getNext()
            } else {
                pNode.pPrev = prevNode
                pNode.pNext = currNode
                prevNode?.pNext = pNode
                if (currNode != nil) {
                    currNode?.pPrev = pNode
                }
                inserted = true
            }
        }
        return pHead
    }
    
    func nodeInFront(pHead: DLink) -> DLink? {
        return pHead
    }
    
    func removeFrontNode(pHead: DLink?) -> DLink? {
        guard let pHead = pHead else {
            return nil
        }
        let newHead = pHead.pNext
        newHead?.pPrev = nil
        pHead.pNext = nil
        return newHead
    }
    
    func removeNode(pHead: DLink, pNode: DLink) -> DLink? {
        if pNode.pPrev == nil {
            if pNode.pNext != nil {
                pNode.pNext?.pPrev = nil
                return pNode.pNext
            }
            pNode.pPrev?.pNext = pNode.pNext
        }
        
        if pNode.pNext != nil {
            pNode.pNext?.pPrev = pNode.pPrev
        }
        return pHead
    }
}
