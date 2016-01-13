function CListComponent(listDescriptor, elementComponents)

    this = CComponentBase(listDescriptor)
    
    this.componentType = "list"
    this.elementComponentArray = elementComponents
    
    this.repeat = true
    this.scrollPosition = 0
    this.padding = listDescriptor.padding
    
    this.fShow = function()
        
        m.renderer = CListRenderer()

        'show all components contained by the list that are on screen right now
        for i = 0 to m.elementComponentArray.Count() - 1 step 1
            m.elementComponentArray[i].fShow()
        end for
        
    end function    'fShow
    
    
    this.fTweenPositive = function()
    
    end function    'fTweenPositive
    
    
    this.fTweenNegative = function()
    
    end function    'fTweenNegative
    
    
    return this

end function    'CListComponent