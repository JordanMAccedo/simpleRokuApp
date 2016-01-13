function CTweener ()

    this = {}
    this.nextTweenId = 0
    this.tweenAA = {}
    this.eventDispatcher = GetGlobalAA().eventDispatcher
    
    this.eventDispatcher.fAddEventListener("CTimeEvent", "Tweener", "fOnAppTimeTick", this)
    
    this.fAddTween = function(tweenedObject as Object, tweenedProperty as String, delta, durationInMilliseconds, tweenType = "linear")
        
        newTween = CTween(m.nextTweenId, tweenedObject, tweenedProperty, delta, durationInMilliseconds, tweenType)
        m.tweenAA[newTween.id.ToStr()] = newTween
        
        m.nextTweenId = m.nextTweenId + 1
        
        return newTween.id
    end function    'fAddTween
    
    
    this.fRemoveTween = function(tweenId)
        m.tweenAA.Delete(tweenId.ToStr())
    end function    'fRemoveTween
    
    
    this.fOnAppTimeTick = function(timeEvent)
    
        currentTween = Invalid
        tweenComplete = false
        
        'update all the tweens
        for each key in m.tweenAA
        
            currentTween = m.tweenAA[key]
            tweenComplete = currentTween.fUpdateTween(timeEvent.deltaMilliseconds)
        
            if (tweenComplete = true)
            
                m.eventDispatcher.fDispatchEvent( CTweenEvent(currentTween.id) )
                m.fRemoveTween(currentTween.id)
                
            end if
        end for
    
    end function    'fOnAppTimeTick
    
    
    return this

end function    'CTweener