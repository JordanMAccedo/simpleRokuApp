function CShapeRenderer () as Object

    this = CRendererBase()
    
    this.fDraw = function (renderTarget, position, component)
        renderTarget.DrawRect( position.x + component.x, position.y + component.y, component.w * component.scaleX, component.h * component.scaleY, component.colour)
    end function    'fDraw
    
    return this

end function    'ShapeRenderer