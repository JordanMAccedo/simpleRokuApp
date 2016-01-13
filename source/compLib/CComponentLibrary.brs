function CComponentLibrary()
    print 'ComponentLibrary v0.1'

    GetGlobalAA().eventDispatcher = CEventDispatcher()
    GetGlobalAA().appTime = CAppTime(60)
    GetGlobalAA().globalMessagePort = CMessagePort()
    GetGlobalAA().bitmapCache = CBitmapCache()
    GetGlobalAA().globalTweener = CTweener()

    this = {}
    this.appObjectFactory = CAppObjectFactory()
    this.appObjectDLL = CDoubleLinkedList()
    
    this.screen = CreateObject("roScreen", true, 1280, 720) 
    
    dispatcher = GetGlobalAA().eventDispatcher 
    dispatcher.fAddEventListener("CTimeEvent", "ComponentLibrary", "fOnAppTimeTick", this)
    
    globalMPort = GetGlobalAA().globalMessagePort
    this.screen.SetMessagePort(globalMPort.messagePort)
    
    'this starts the main loop (contained in CAppTime)
    this.fStart = function()
        appTime = GetGlobalAA().appTime 
        appTime.fRun()
    end function    'fStart
    
    
    this.fOnAppTimeTick = function(timeEvent)
    
        m.fUpdate(timeEvent.deltaMilliseconds)
        m.fRender()
        
    end function    'fOnAppTimeTick
    
    
    this.fUpdate = function(deltaMilliseconds)
    
        msgPort = GetGlobalAA().globalMessagePort
        msgPort.fReadMessageQueue()
        
        currentNode = m.appObjectDLL.head
        
        while currentNode <> Invalid
        
            currentNode.content.fUpdate(deltaMilliseconds)
            currentNode = currentNode.fNextNode()
        end while
    
    end function    'fUpdate
    
    
    this.fRender = function()
        
        m.screen.Clear(&h000000ff)
        currentNode = m.appObjectDLL.head
        
        while currentNode <> Invalid
        
            currentNode.content.fRender(m.screen)
            currentNode = currentNode.fNextNode()
        end while
    
        m.screen.SwapBuffers()
        
    end function    'fRender
    
    
    'create or retrieve AppObj's
    this.fCreateAppObject = function (appObjectDescriptorArray as Object)
        
        createdAppObject = m.appObjectFactory.fCreateAppObject(appObjectDescriptorArray)
        
        m.fAddAppObjectToZSortedList(createdAppObject)

        return createdAppObject
        
    end function 'CreateAppObject
    
    
    'maybe move this functionality inside the list?
    'considered having the list do an Eval () to sort on a specified property of a node's content
    'Eval() might be too heavy to do every time we insert a new CAppObject
    this.fAddAppObjectToZSortedList = function (createdAppObject)
        
        'z-index of -1, add to tail (on top)
        if(createdAppObject.position.z < 0)
            m.appObjectDLL.fAddAtTail(createdAppObject)
        
        'z-index of 0, add to head (behind everything)
        else if (createdAppObject.position.z = 0)
            m.appObjectDLL.fAddAtHead(createdAppObject)
        
        else
            currentNode = m.appObjectDLL.head
            
            'if no head exists, just add the new object to the head and we're done!
            if (currentNode = Invalid)
                m.fAddAtHead(createdAppObject)
            else
                nodeInserted = false
                
                while (currentNode <> Invalid)
                    'insert before the first node with a higher z-index than the new object
                    if(currentNode.content.position.z > createdAppObject.position.z)
                        currentNode.fInsertBefore( CDLLNode(createdAppObject) )
                        nodeInserted = true
                    else
                        currentNode = currentNode.fNextNode()
                    end if
                end while
                
                'if the node was not inserted it has the highest z-index in the list, add at tail
                if (nodeInserted = false)
                    m.appObjectDLL.fAddAtTail(createdAppObject)
                end if
                
            end if
        end if
        
    end function 'fAddToZSortedList
    
    
    return this

end function 'ComponentLibrary