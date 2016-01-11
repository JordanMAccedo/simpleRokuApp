function CEventDispatcher ()

    this = {}
    this.eventListenerAA = {}
    
    
    this.fAddEventListener = function (eventType, listeningObjectName as String, listeningFunctionName as String, listeningObject as Object)
    
        listener = CEventListener(listeningObjectName, listeningFunctionName)
        
        if(m.eventListenerAA[eventType] = Invalid)
            m.eventListenerAA[eventType] = {}
            m.eventListenerAA[eventType][listeningObjectName + "::" + listeningFunctionName] = CEventListener(listeningObject, listeningFunctionName) 
        end if
    
    end function    'fAddEventListener
    
    
    this.fRemoveEventListener = function (eventType, listeningObjectName as String, listeningFunctionName as String)
    
        if(m.eventListenerAA <> Invalid)
            m.eventListenerAA[eventType].Delete(listeningObjectName + "::" + listeningFunctionName)
        end if
        
    end function    'fRemoveEventListener
    
    
    this.fDispatchEvent = function (event)
    
        listeners = m.eventListenerAA[event.eventType] 
        
        if (listeners <> Invalid)
            for each key in listeners
                listeners[key].fDispatchEvent(event)
            end for
        end if
    
    end function    'fDispatchEvent
    
    
    return this

end function    'CEventDispatcher



