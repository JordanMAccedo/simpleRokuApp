function CTextComponent (textDescriptor, fontManager)

    this = CComponentBase(textDescriptor)

    this.componentType = textDescriptor.componentType
    
    this.content = textDescriptor.content
    this.fontFamily = textDescriptor.fontFamily
    this.fontSize = textDescriptor.fontSize
    
    this.bold = textDescriptor.bold
    this.italic = textDescriptor.italic

    this.font = fontManager.fGetFont(this.fontFamily, this.fontSize, this.bold, this.italic)
    this.colour = textDescriptor.colour
    
    this.x = textDescriptor.position.x
    this.y = textDescriptor.position.y

    this.fShow = function ()
        m.renderer = CTextRenderer()
    end function 'fShow
    
    return this
    
end function   'CTextComponent