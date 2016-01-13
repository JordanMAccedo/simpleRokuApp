function CComponentBase(descriptor = Invalid) as Object

    'make sure the global componentCount value is ready
    if( GetGlobalAA().componentCount = Invalid)
        GetGlobalAA().componentCount = 0
    end if
    
    this = {}
    this.active = true
    
    this.renderer = Invalid             'TODO: allow a component to have multiple renderers
    this.appObject = Invalid        'reference to the CAppObject or component that contains this component

    this.componentType = "base"

    if (descriptor <> Invalid)
        this.componentType = descriptor.componentType
    end if

    'assign each component a unique id and increment the global count
    this.id = GetGlobalAA().componentCount
    GetGlobalAA().componentCount = GetGlobalAA().componentCount + 1
    
    
    this.fActivate = function()
        'don't trigger OnActivate if the component was already active
        if(m.active = false)
            m.active = true
            m.fOnActivate()
        end if
    end function 'Activate
    
    this.fDeactivate = function()
        'don't trigger OnDeactivate if the component was already inactive
        if(m.active = true)
            m.active = false
            m.fOnDeactivate()
        end if
    end function 'Deactivate


    'the host object is usually a CAppObject, but can also be another component
    this.fSetAppObjectReference = function (appObjectReference)
        m.appObject = appObjectReference
        m.fOnAddedToObject()
    end function    'fSetAppObjectReference


    '=== Overwrite these functions if needed in "derived" components ===
    this.fOnActivate = function()
    end function 'OnActivate
    this.fOnDeactivate = function()
    end function 'OnDeactivate
    
    this.fShow = function()
    end function 'fShow
    this.fHide = function()
        m.renderer = Invalid
    end function 'fHide
    
    this.fUpdate = function(deltaMilliseconds)
    end function    'fUpdate
    
    this.fOnAddedToObject = function()
    end function    'fOnAddedToObject
    
    '=== do not overwrite anything beyond this line ===
    
    return this
    
end function 'CComponentBase