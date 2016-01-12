function CBitmapCache()

    this = {}
    this.activeRequests = {}
    this.textureManager = CreateObject("roTextureManager")
    this.messagePort = CreateObject("roMessagePort")    

    this.textureManager.SetMessagePort(GetGlobalAA().globalMessagePort.messagePort)
    
    
    this.fRequestTexture = function (source)

        newRequest = CBitmapRequest(source)
        m.textureManager.RequestTexture(newRequest.request)
        'stop
        m.activeRequests [newRequest.id.ToStr()] = newRequest
        
        return newRequest.id
    
    end function    'fRequestTexture
    
     
    
    return this

end function    'CBitmapCache