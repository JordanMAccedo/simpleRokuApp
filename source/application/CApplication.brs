function CApplication (p_componentLibrary) as Object

    this = {}
    this.running = true
    this.componentLibrary = p_componentLibrary
    this.mainView = Invalid
    
    this.fSetup = function ()
        'tempDescriptor = [{componentType:"shape", colour:&hffffffff, position:{x:0,y:0}, size:{x:250, y:100}}, 
        '{componentType:"text", content:"this is test text", fontFamily:"default", fontSize:30, colour:&h0000ffff, position:{x:100, y:0}, bold:false, italic:false},
        '{componentType:"tween", targetValuePath:"position.x", delta:100, durationInMilliseconds:1000, tweenType:"linear", startActive:false}]

        tempDescriptor = [{componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:0, y:0}},
                            {componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:50, y:50},}
                            {componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:100, y:100},}
                            {componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:150, y:150},}
                            {componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:200, y:200},}
                            {componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:250, y:250},}
                            {componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:300, y:300},}
                            {componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:350, y:350},}
                            {componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:400, y:400},}
                            {componentType:"bitmap", source:"pkg:/images/featuredSample.jpg", position:{x:450, y:450}},
                            {componentType:"tween", targetValuePath:"position.x", delta:100, durationInMilliseconds:1000, tweenType:"linear", startActive:false}]
        
        m.mainView = m.componentLibrary.fCreateAppObject(tempDescriptor)
        
    end function 'fSetup
    
    this.fSetup()
    this.Delete("fSetup")

    return this

end function 'Application