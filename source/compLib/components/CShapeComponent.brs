function CShapeComponent(shapeDescriptor) as Object

    this = CComponentBase()
    
    this.componentType = shapeDescriptor.componentType
        
    this.colour = shapeDescriptor.colour
    
    this.x = shapeDescriptor.position.x
    this.y = shapeDescriptor.position.y
    
    this.w = shapeDescriptor.size.x
    this.h = shapeDescriptor.size.y
    
    this.scaleX = 1
    this.scaleY = 1
    
    this.fShow = function ()
        m.renderer = CShapeRenderer()
    end function 'fShow
    
    return this
    
end function 'ShapeComponent