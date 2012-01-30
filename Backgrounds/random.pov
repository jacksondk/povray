                           // The standard collection of textures

#include "textures.inc"               
// various glass finishes, colors and interiors
//
#include "glass.inc"



// perspective (default) camera
camera {
  location  <0.0, 4.0, -3.0>
  look_at   <0.5, 1.0,  1.5>
  right     x*image_width/image_height
}
// An area light (creates soft shadows)
// WARNING: This special light can significantly slow down rendering times!
light_source {
  <0,0,0>             // light's position (translated below)
  color rgb 1.0       // light's color
  area_light
  <8, 0, 0> <0, 0, 8> // lights spread out across this distance (x * z)
  4, 4                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
  circular            // make the shape of the light circular
  orient              // orient light
  translate <40, 80, -40>   // <x y z> position of light
}


plane { <0,1,0>, 0  hollow // normal vector, distance to zero ----

        texture{ pigment{ color rgb<0.55,0.60, 0.55> }
	         
                 finish { phong 1 }
               } // end of texture
        scale < 1, 1, 1>        
        translate<2,0.0,0>
      } // end of plane ------------------------------------------


#declare Random_1 = seed (52053); // Use: "rand(Random_1)" 
#declare Random_2 = seed ( 1953); // Use: "rand(Random_2)"
#declare Random_3 = seed (  153); // Use: "rand(Random_3)"


blob{   
 threshold 0.6
 // outer loop
 #local NrX = 0;    // start x
 #local EndNrX = 6; // end   x
 #while (NrX< EndNrX) 
 
    // more inner loop
    #local NrY = 0;    // start y 
    #local EndNrY = 6; // end   y
    #while (NrY< EndNrY)         
    
       // innerst loop
       #local NrZ = 0;    // start z
       #local EndNrZ = 8; // end   z
       #while (NrZ< EndNrZ) 
     
       sphere{ <NrX*0.5 + 0.35*(-0.5+rand(Random_1)),
                NrY*0.5 + 0.35*(-0.5+rand(Random_2)),
                NrZ*0.5 + 0.35*(-0.5+rand(Random_3)) >, 0.4, 1
                          
       
            } // end of sphere  

       #local NrZ = NrZ + 1;  // next Nr z
       #end // --------------- end of loop z
       // end innerst loop
    #local NrY = NrY + 1;  // next Nr y
    #end // --------------- end of loop y
    // end more inner loop
 #local NrX = NrX + 1;  // next Nr x
 #end // --------------- end of loop x                         
 // end of outer loop 
              texture { spiral1 5 scale 0.5                   //---------------- 
                   texture_map{ [0.25 pigment{ color rgbf <1,0.65,0.2,0>}
                                      normal { bumps 0.5 scale 0.25}
                                      finish { phong 0.2 reflection 0.30}]
                                [0.25 pigment{ color rgbf <1,1,1,1>} ]
                                [0.75 pigment{ color rgbf <1,1,1,1>} ]
                                [0.75 pigment{ color rgbf <1,0.65,0.2,0>}
                                      normal { bumps 0.5 scale 0.25}
                                      finish { phong 0.2 reflection 0.30}]
                              } // end of texture_map
                    rotate<90,0,0>
                 } // end of texture ------------------------------------- 

 /*
          material{ texture { Orange_Glass } // end of texture 
                   interior{ I_Glass } // end of interior
                 } // end of material -------------------
   */
rotate<0,-30,0> 
translate<0,0.2,-0.5>} // end of union
