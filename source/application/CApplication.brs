function CApplication (p_componentLibrary) as Object

    this = {}
    this.running = true
    this.componentLibrary = p_componentLibrary
    this.mainView = Invalid
    
    this.currentTweenId = -1
    this.tweenBusy = false
    
    this.listComp = Invalid
    
    this.fSetup = function ()
        'tempDescriptor = [{componentType:"shape", colour:&hffffffff, position:{x:0,y:0}, size:{x:250, y:100}}, 
        '{componentType:"text", content:"this is test text", fontFamily:"default", fontSize:30, colour:&h0000ffff, position:{x:100, y:0}, bold:false, italic:false},
        '{componentType:"tween", targetValuePath:"position.x", delta:100, durationInMilliseconds:1000, tweenType:"linear", startActive:false}]

        'tempDescriptor = [{componentType:"bitmapLoader", source:"pkg:/images/featuredSample.jpg", position:{x:0, y:0}},
        '                    {componentType:"tween", targetValuePath:"position.x", delta:100, durationInMilliseconds:1000, tweenType:"linear", startActive:false}]
        
        tempDescriptor = [ {componentType:"list", repeat:true, padding:256, content:[
                                                                                        {componentType:"text", content:"this is test text", fontFamily:"default", fontSize:30, colour:&h0000ffff, position:{x:0, y:0}, bold:false, italic:false},
                                                                                        {componentType:"bitmapLoader", source:"pkg:/images/featuredSampleSmall.jpg", position:{x:0, y:0}},
                                                                                        {componentType:"shape", colour:&ha0a0a0ff, position:{x:0,y:0}, size:{x:250, y:100}},
                                                                                        {componentType:"shape", colour:&hff0000ff, position:{x:0,y:0}, size:{x:250, y:100}},
                                                                                        {componentType:"shape", colour:&hff00ffff, position:{x:0,y:0}, size:{x:250, y:100}},
                                                                                        {componentType:"shape", colour:&h00ff00ff, position:{x:0,y:0}, size:{x:250, y:100}},
                                                                                        {componentType:"shape", colour:&h0000ffff, position:{x:0,y:0}, size:{x:250, y:100}}]
                            }]
        'tempDescriptor = [ {componentType:"list", repeat:true, padding:500, content:[{componentType:"text", content:"this is test text", fontFamily:"default", fontSize:30, colour:&h0000ffff, position:{x:0, y:0}, bold:false, italic:false}]}]
        'tempDescriptor = [ {componentType:"list", repeat:true, padding:500, content:[{componentType:"bitmapLoader", source:"pkg:/images/featuredSample.jpg", position:{x:0, y:0}}]}]


        m.mainView = m.componentLibrary.fCreateAppObject(tempDescriptor)
        
        m.listComp = m.mainView.fGetComponentOfType("list")
        
        eventDispatcher = GetGlobalAA().eventDispatcher
        eventDispatcher.fAddEventListener("CInputEvent", "Application", "fOnInputEvent", m)
        'eventDispatcher.fAddEventListener("CTimeEvent", "Application", "fOnAppTimeTick", m)
        eventDispatcher.fAddEventListener("CTweenEvent", "Application", "fOnTweenComplete", m)
        
    end function 'fSetup
    
    '(tweenedObject as Object, tweenedProperty as String, delta, durationInMilliseconds, tweenType = "linear")
    this.fOnInputEvent = function(inputEvent)
        '4 <-   5 ->
        
        if (m.tweenBusy = false)
            
            tweener = GetGlobalAA().globalTweener
            
            if (inputEvent.buttonValue = 4)
                m.currentTweenId = tweener.fAddTween(m.listComp, "scrollPosition", -250, 100)
                m.tweenBusy = true
            else if (inputEvent.buttonValue = 5)
                m.currentTweenId = tweener.fAddTween(m.listComp, "scrollPosition", 250, 100)
                m.tweenBusy = true 
            end if
        end if
        
    end function    'fOnInputEvent
    
    
    this.fOnTweenComplete = function(tweenEvent)

        if (tweenEvent.tweenId = m.currentTweenId)
            m.tweenBusy = false
            m.currentTweenId = -1
        end if
        
    end function    'fOnTweenComplete
    
    
    this.fOnAppTimeTick = function (timeEvent)
    
    
    end function    'fOnAppTimeTick
    
    this.fSetup()
    this.Delete("fSetup")

    return this

end function 'Application