function CBitmapEvent(success, requestId, bitmap)

    this = CEventBase("CBitmapEvent")
    this.success = success
    this.requestId = requestId
    this.bitmap = bitmap
    
    return this

end function    'CImageEvent