function CTimeEvent (totalTime, deltaTime)

    this = CEventBase("CTimeEvent")
    this.totalMilliseconds = totalTime
    this.deltaMilliseconds = deltaTime
    
    return this

end function    'CTimeEvent