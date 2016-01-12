function CAppTime (fps = 30)
    
    this = {}
    
    this.timespan = CreateObject("roTimespan")
    this.tickDelay = Fix(1000 / fps)
    this.lastUpdateTime = 0
    this.eventDispatcher = GetGlobalAA().eventDispatcher

    this.debugElapsedTime = 0
    this.framesThisSecond = 0

    this.fRun = function()
        while true
        
            m.fAdvanceAppTime()
            
        end while
        
    end function    'fRun
    
    
    this.fAdvanceAppTime = function()
    
        deltaT = m.timespan.TotalMilliseconds() - m.lastUpdateTime 
        
        if ( deltaT >= m.tickDelay)

            m.lastUpdateTime = m.lastUpdateTime + deltaT
            m.eventDispatcher.fDispatchEvent( CTimeEvent(m.lastUpdateTime, deltaT) )

            m.fPrintFPS(deltaT)
        end if
  
    end function    'fAdvanceAppTime
    
    
    this.fPrintFPS = function(deltaT)
        ''print out current FPS to the console
        m.debugElapsedTime = m.debugElapsedTime + deltaT
        m.framesThisSecond = m.framesThisSecond + 1
        
        if(m.debugElapsedTime >= 1000)
            m.debugElapsedTime = m.debugElapsedTime - 1000
            print m.framesThisSecond 
            m.framesThisSecond = 0
        end if 
    end function    'fPrintFPS
    
    
    this.timespan.Mark()
    
    return this

end function