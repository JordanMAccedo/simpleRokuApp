function CApplication (p_componentLibrary) as Object

    this = {}
    this.running = true
    this.componentLibrary = p_componentLibrary
    this.mainView = Invalid
    
    this.fSetup = function ()
        tempDescriptor = [{componentType:"shape", colour:&hffffffff, position:{x:0,y:0}, size:{x:250, y:100}}, 
        {componentType:"text", content:"this is test text", fontFamily:"default", fontSize:30, colour:&h0000ffff, position:{x:100, y:0}, bold:false, italic:false}]

        m.mainView = m.componentLibrary.fCreateAppObject(tempDescriptor)
        
    end function 'fSetup
    
    this.fSetup()
    this.Delete("fSetup")

    return this

end function 'Application