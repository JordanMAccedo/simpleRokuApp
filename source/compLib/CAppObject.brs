function CAppObject()
    
    this = {}
    this.componentAA = []
    this.position = {x:100, y:100, z:0}

    this.fGetComponentOfType = function (componentType as String)
        
        if(m.componentAA = Invalid)
            return Invalid
        end if
        
        if (m.componentAA <> Invalid)
            for i=0 to m.componentAA.Count() step 1
                if (m.componentAA[i].componentType = componentType)
                    return m.componentAA[i]
                end if    
            end for
        end if
        
        return Invalid
        
    end function 'fGetComponentOfType

    
    this.fGetAllComponentsOfType = function (componentType as String)
        foundComponents = []
        
        for i=0 to m.componentAA.Count() step 1
            if (m.componentAA[i].componentType = componentType)
                foundComponents.Push(m.componentAA[i])
            end if    
        end for
        
        return foundComponents
        
    end function 'fGetAllComponentsOfType

    
    'componentDescriptor: AA of fields that describe the component
    this.fAddComponent = function (newComponent as Object)
        
        if (m.componentAA = Invalid)
            m.componentAA = []
        end if

        newComponent.fSetAppObjectReference(m)

        m.componentAA.push(newComponent)
        
    end function 'fAddComponent
    
    
    this.fUpdate = function (deltaMilliseconds)
    
       'loop through all components and update any active ones
        for i=0 to (m.componentAA.Count() - 1) step 1
            if (m.componentAA[i].active = true)
                m.componentAA[i].fUpdate(deltaMilliseconds)
            end if    
        end for
    
    end function 'fUpdate
    
    
    this.fRender = function (screen)

        'loop through all components and draw any renderers
        for i=0 to (m.componentAA.Count() - 1) step 1
            if (m.componentAA[i].renderer <> Invalid)
                m.componentAA[i].renderer.fDraw(screen, m.position, m.componentAA[i])
            end if    
        end for

    end function 'fRender

    ''END FUNCTION DEFINITIONS


return this

end function 'CAppObject