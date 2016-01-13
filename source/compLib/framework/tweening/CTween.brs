function CTween(id, targetObject, targetProperty, delta, duration, tweenType)

    this = {}
    this.id = id
    this.targetObject = targetObject
    this.targetProperty = targetProperty
    this.tweenType = tweenType
    this.delta = delta
    this.duration = duration
    this.elapsedTime = 0
    this.targetPropertyInitialValue = this.targetObject[this.targetProperty]
    
    
    'returns true if the tween is complete, or false if it is not
    this.fUpdateTween = function (deltaTime)
        m.elapsedTime = m.elapsedTime + deltaTime
        
        elapsedTimeRatio = m.elapsedTime / m.duration
        
        if(elapsedTimeRatio >= 1)
            elapsedTimeRatio = 1
        end if
        
        m.targetObject[m.targetProperty] = m.targetPropertyInitialValue + (m.delta * elapsedTimeRatio)
        
        if(elapsedTimeRatio >= 1)
            return true
        else
            return false
        end if
        
    end function    'fUpdateTween
    
    
    return this

end function    'CTween