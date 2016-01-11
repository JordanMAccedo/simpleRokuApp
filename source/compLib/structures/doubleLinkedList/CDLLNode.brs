function CDLLNode (nodeContent) as Object

    this = {}
    this.content = nodeContent
    this.nNode = Invalid
    this.pNode = Invalid
    
    
    this.fInsertAfter = function (newNode)
        if (m.nNode = Invalid)
            newNode.pNode = m
            m.nNode = newNode
        else
            m.nNode.pNode = newNode
            newNode.nNode = m.nNode
            
            m.nNode = newNode
            newNode.pNode = m
        end if
            end function 'fInsertAfter
    
    
    this.fInsertBefore = function (newNode)
        if (m.pNode = Invalid)
            m.pNode = newNode
            newNode.nNode = m
        else
            m.pNode.nNode = newNode
            newNode.pNode = m.pNode
            
            m.pNode = newNode
            newNode.nNode = m
        end if
    end function 'fInsertBefore
    
    
    this.fRemove = function ()
        
        if (m.pNode <> Invalid and m.nNode <> Invalid)
            m.pNode.nNode = m.nNode
            m.nNode.pNode = m.pNode
        else if (m.pNode = Invalid and m.nNode <> Invalid)
            m.nNode.pNode = Invalid
        else if (m.pNode <> Invalid and m.nNode = Invalid)
            m.pNode.nNode = Invalid
        end if
    
        return content
    end function 'fRemove
    
    
    this.fNextNode = function ()
        return m.nNode
    end function 'fNextNode
    
    
    this.fPrevNode = function ()
        return m.pNode
    end function    'fPrevNode
    
    return this

end function 'CDLLNode