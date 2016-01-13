function CBitmapLoaderComponent(bitmapLoaderDescriptor)

    this = CComponentBase(bitmapLoaderDescriptor)

    this.source = bitmapLoaderDescriptor.source
    this.port = CreateObject("roMessagePort")
    this.bitmap = Invalid
    
    this.x = bitmapLoaderDescriptor.position.x
    this.y = bitmapLoaderDescriptor.position.y
    
    this.requestId = -1
    
    this.fLoadImage = function()
        ed = GetGlobalAA().eventDispatcher 
        ed.fAddEventListener("CBitmapEvent", "BitmapLoaderComponent_" + m.id.ToStr(), "fOnImageEvent", m)
        
        bmpCache = GetGlobalAA().bitmapCache
        
        newId = bmpCache.fRequestTexture(m.source)

        m.requestId = newId
    
    end function    'fLoadImage
    
    
    'imageEvent - CBitmapEvent
    this.fOnImageEvent = function(bitmapEvent)

        if(bitmapEvent.requestId = m.requestId)
            if (bitmapEvent.success = true and bitmapEvent.bitmap <> Invalid)
                ed = GetGlobalAA().eventDispatcher 
                ed.fRemoveEventListener("CBitmapEvent", "BitmapLoaderComponent_" + m.id.ToStr(), "fOnImageEvent")
                m.bitmap = bitmapEvent.bitmap
                
                m.fShow()
            else
                'what do if fail?
                print "bitmap failed to load"
            end if
        end if      'requestId = m.requestId
        
    end function    'fOnImageEvent
    
    
    this.fShow = function()
        if (m.bitmap <> Invalid and m.renderer = Invalid)
            m.renderer = CBitmapRenderer()
        else
            m.fLoadImage()
        end if
    
    end function    'fShow
    
    return this

end function    'CImageLoaderComponent