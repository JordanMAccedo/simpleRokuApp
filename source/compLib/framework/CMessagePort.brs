function CMessagePort()

    this = {}
    this.messagePort = CreateObject("roMessagePort")
    this.eventDispatcher = GetGlobalAA().eventDispatcher
    
    this.fReadMessageQueue = function()
        
        currentMessage = m.messagePort.GetMessage()
        
        if (currentMessage <> Invalid)
        
            if (Type(currentMessage) = "roTextureRequestEvent")
                m.fHandleImageLoadMessage(currentMessage)
            end if
        
        end if
        
    end function    'fReadMessageQueue
    
    
    this.fHandleImageLoadMessage = function (textureReqEvent)
        
        'state 3 denotes a ready image, state 4 denotes a failed image
        if (textureReqEvent.GetState() = 3 or textureReqEvent.GetState() = 4)
        
            event = Invalid
            
            if (textureReqEvent.GetState() = 3 and textureReqEvent.GetBitmap() <> Invalid)
                event = CBitmapEvent(true, textureReqEvent.GetId(), textureReqEvent.GetBitmap())
            else
                event = CBitmapEvent(false, textureReqEvent.GetId(), Invalid)
            end if
            
            m.eventDispatcher.fDispatchEvent(event)
        
        end if

    end function    'fHandleImageLoadMessage
    
    
    return this

end function    'CMessagePort