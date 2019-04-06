//
//
//      take a vector and doa matrix rotation
//      [cosA, -sinA][x]  [Rx]
//      [sinA, cosA][y] = [Ry]
//
{
    vec[0] = argument0; //x
    vec[1] = argument1; //y
    _angle = argument2;
    
    rvec[1] = sin(_angle)*vec[0] + cos(_angle)*vec[1]; //y
    rvec[0] = cos(_angle)*vec[0] - sin(_angle)*vec[1]; //x
    
    //rvec[1] = 1*vec[1] + 0*vec[1]; //y
    //rvec[0] = 0*vec[0] - -1*vec[0]; //x
    
    return rvec;

}
