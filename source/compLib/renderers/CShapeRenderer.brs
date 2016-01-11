function CShapeRenderer (hostComponent) as Object

    this = CRendererBase()
    
    this.fDraw = function (renderTarget, position, component)
        renderTarget.DrawRect( position.x + component.x, position.x + component.y, component.w * component.scaleX, component.h * component.scaleY, component.colour)
    end function    'fDraw
    
    return this

end function    'ShapeRenderer