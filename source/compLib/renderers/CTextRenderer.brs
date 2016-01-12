function CTextRenderer () as Object

    this = CRendererBase()
    
    this.fDraw = function (renderTarget, position, component)
        renderTarget.DrawText(component.content, position.x + component.x, position.y + component.y, component.colour, component.font)
    end function 'fDraw
    
    return this
end function 'CTextRenderer