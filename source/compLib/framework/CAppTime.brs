function CAppTime (fps = 30)
    
    this = {}
    
    this.timespan = CreateObject("roTimespan")
    this.tickDelay = 1000 / fps
    this.lastUpdateTime = 0
    this.eventDispatcher = GetGlobalAA().eventDispatcher
    
    
    this.fRun = function()
        while true
        
            m.fAdvanceAppTime()
            
        end while
        
    end function    'fRun
    
    
    this.fAdvanceAppTime = function()
    
        deltaT = m.timespan.TotalMilliseconds() - m.lastUpdateTime 
        
        if ( deltaT >= m.tickDelay)

            m.lastUpdateTime = m.timespan.TotalMilliseconds()
            m.eventDispatcher.fDispatchEvent( CTimeEvent(m.timespan.TotalMilliseconds(), deltaT) )
        end if
  
    end function    'fAdvanceAppTime
    
    
    this.timespan.Mark()
    
    return this

end function