function CAppObjectFactory()

    this = {}
    this.fontManager = CFontManager()

    this.fCreateAppObject = function (appObjectDescriptorArray as Object)
        
        newAppObject = CAppObject()
    
        'loop through all component descriptors in appObjectDescriptor
        'create and add them all
        
        for i=0 to appObjectDescriptorArray.Count() - 1
            createdComponent = m.fCreateComponentFromDescriptor (appObjectDescriptorArray[i])
           
            if (createdComponent <> Invalid)
                newAppObject.fAddComponent (createdComponent)
            end if
        end for
        return newAppObject
    end function 'fBuildAppObject

    this.fCreateComponentFromDescriptor = function(descriptor as Object)
            
        'create the ComponentBase that the new component will use as a prototype
        createdComponent = Invalid
        
        'find the correct component to create using the "componentType" specified in the descriptor
        if (descriptor.componentType = "shape")
            createdComponent = CShapeComponent(descriptor)
            createdComponent.fShow()
        else if (descriptor.componentType = "text")
            createdComponent = CTextComponent(descriptor, m.fontManager)
            createdComponent.fShow()
        end if
        
        
        return createdComponent
        
    end function 'fCreateComponentFromDescriptor

    
    return this

end function 'CComponentFactory