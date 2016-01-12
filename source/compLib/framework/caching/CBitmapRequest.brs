function CBitmapRequest (imageSource)

    this = {}
    this.request = CreateObject("roTextureRequest", imageSource)
    this.id = this.request.GetId()
    
    return this

end function    'CBitmapRequest