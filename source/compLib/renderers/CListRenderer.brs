function CListRenderer()

    this = CRendererBase()
    
    
    this.fDraw = function(renderTarget, position, component)
        
        'use renderCount as a counter to space out the renderers as it will only be implemented for components
        '   that have a renderer (i will be incremented either way)
        rendererCount = 0
        
        'loop through all the renderers of the components in the list
        for i = 0 to component.elementComponentArray.Count() - 1 step 1
        
            'make sure the component has a renderer
            if (component.elementComponentArray[i].renderer <> Invalid)
                componentPosition = {x:position.x, y:position.y, z:position.z}
                componentPosition.x = componentPosition.x + rendererCount * component.padding - component.scrollPosition
                
                rendererCount = rendererCount + 1

                component.elementComponentArray[i].renderer.fDraw(renderTarget, componentPosition, component.elementComponentArray[i]) 
                
            end if
        end for
    end function    'fDraw
        
    
    return this

end function    'CListRenderer