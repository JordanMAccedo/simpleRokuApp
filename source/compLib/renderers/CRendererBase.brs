function CRendererBase () as Object
    
    this = {}
    
    'overwrite in derived renderers
    this.fDraw = function (renderTarget, position, component)
          
    end function    
    
    
    return this

end function 'CRendererBase