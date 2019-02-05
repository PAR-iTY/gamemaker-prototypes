///pointInRotatedRectangle(pointX, pointY, rectX, rectY, rectOffsetX, rectOffsetY, rectWidth, rectHeight, rectAngle)

// https://yal.cc/rot-rect-vs-circle-intersection
// constructs a local relative model of a rotated rectangle
// interacting with a basic shape where rotation doesn't matter
// like a point, circle, or a line segment for collision testing

// (might have to convert from js syntax like Math.cos...)
    var relX = pointX - rectX;
    var relY = pointY - rectY;
    var angle = -rectAngle;
    //var angleCos = Math.cos(angle);
    //var angleSin = Math.sin(angle);
    var localX = angleCos * relX - angleSin * relY;
    var localY = angleSin * relX + angleCos * relY;
    return localX >= -rectOffsetX && localX <= rectWidth - rectOffsetX &&
           localY >= -rectOffsetY && localY <= rectHeight - rectOffsetY;
