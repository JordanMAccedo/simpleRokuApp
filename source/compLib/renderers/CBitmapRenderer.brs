function CBitmapRenderer()

    this = CRendererBase()


    this.fDraw = function (renderTarget, position, component)
        if(component.bitmap <> Invalid)
            renderTarget.DrawObject (position.x + component.x, position.y + component.y, component.bitmap)
        end if
    end function    'fDraw


    return this

end function    'CBitmapRenderer