function CFontManager ()

    this = {}
    
    this.fontRegistry = CreateObject("roFontRegistry")
    
    this.fGetFont = function(family as String, size as Integer, bold as Boolean, italic as Boolean)
        retrievedFont = m.fontRegistry.GetFont(family, size, bold, italic)
        
        'use the default font if the requested font was unavailable
        if(retrievedFont = Invalid)
            retrievedFont = m.fGetDefaultFont(size, bold, italic)
        end if
        
        return retrievedFont
    end function 'fGetFont
    
    
    this.fGetDefaultFont = function (size as Integer, bold as Boolean, italic as Boolean)
        return m.fontRegistry.GetDefaultFont(size, bold, italic)
    end function 'fGetDefaultFont

    return this
    
end function    'CFontManager