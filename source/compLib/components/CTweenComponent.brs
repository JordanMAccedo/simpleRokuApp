function CTweenComponent (tweenDescriptor) as Object

    this = CComponentBase()
    
    this.active = true 'tweenDescriptor.startActive
    this.targetValuePath = tweenDescriptor.targetValuePath
    this.duration = tweenDescriptor.duration
    this.delta = tweenDescriptor.delta
    this.tweenType = "linear"
    this.elapsedTime = 0
    'this.targetValuePathList = Invalid
    
    this.targetObject = Invalid
    this.targetValue = ""
    
 
    this.fParseTargetValue = function ()
        
        'Split() the provided path on the "." character (returns an roList)
        regex = CreateObject("roRegex", "\.", "")
        targetValuePathList = regex.Split(m.targetValuePath)

        i = 0
        targetReference = m.appObject

        'look through the new roList and get a reference to the second-last object in the chain
        while (i < (targetValuePathList.Count() - 1))
            targetReference = targetReference[targetValuePathList[i]]
            i = i+1
        end while
        
        'store a reference to the last object in the path, as well as store the name of the value that is being changed on that object
        m.targetObject = targetReference
        m.targetValue = targetValuePathList[targetValuePathList.Count() - 1]

    end function    'fParseTargetValue
    
 
    this.fOnActivate = function()
        this.elapsedTime = 0
    end function    'fOnActivate
    
 
    this.fUpdate = function (deltaMilliseconds)

        m.elapsedTime = m.elapsedTime + deltaMilliseconds
        m.targetObject[m.targetValue] = m.targetObject[m.targetValue] + 1
        
    end function    'fUpdate
 
    
    this.fOnAddedToObject = function()
        m.fParseTargetValue()
    end function    'fOnAddedToObject
    
 
    return this

end function    'CTweenComponent