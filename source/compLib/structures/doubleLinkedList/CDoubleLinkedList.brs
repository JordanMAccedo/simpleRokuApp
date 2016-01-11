function CDoubleLinkedList () as Object

    this = {}
    this.head = Invalid
    this.tail = Invalid
    
    this.fAddAtHead = function (content)
        newNode = CDLLNode(content)
        
        if (m.head <> Invalid)
            m.head.fInsertBefore(newNode)
        else
            'if head didn't exist, no List existed, so set the tail as well
            m.head = newNode
            m.tail = newNode
        end if
        
    end function 'fAddAtHead
    
    
    this.fAddAtTail = function (content)
        newNode = CDLLNode(content)
        
        if (m.tail <> Invalid)
            m.tail.fInsertAfter(newNode)
        else
            'if tail didn't exist, no List existed, so set the head as well
            m.head = newNode
            m.tail = newNode
        end if
    end function 'fAddAtTail
    
    
    this.fCount = function()
        indexCount = 0
        
        currentNode = m.head
        
        if (currentNode <> Invalid)
            indexCount = 1
        end if
        
        while (currentNode.fNextNode() <> Invalid)
            indexCount = indexCount + 1
            currentNode = currentNode.fNextNode()
        end while
        
        return indexCount
        
    end function 'fCount
    
    
    return this

end function    'CDoubleLinkedList