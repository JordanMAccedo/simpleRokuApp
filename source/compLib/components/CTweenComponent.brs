function CTweenComponent (tweenDescriptor) as Object

    this = CComponentBase()
    
    this.active = tweenDescriptor.startActive
    this.targetValue = tweenDescriptor.targetValue
    this.duration = tweenDescriptor.duration
    this.delta = tweenDescriptor.delta
    this.tweenType = "linear"
    this.timer = Invalid
    
    this.fOnActivate = function()
        this.timer = CreateObject("roTimespan")
    end function    'fOnActivate
    
    this.fUpdate = function (deltaMilliseconds)
    
    end function    'fUpdate
    return this

end function    'CTweenComponent