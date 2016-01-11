function CEventListener (listeningObject as Object, listeningFunctionName as String)

    this = {}
    
    this.listener = listeningObject
    this.functionName = listeningFunctionName
    
    
    this.fDispatchEvent = function (event)
        m.listener[m.functionName](event)
    end function 'fDispatchEvent
    
    return this

end function 'CEventListener