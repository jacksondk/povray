// perspective (default) camera
camera {
  location  <0.0, 8.0, -10.0>
  look_at   <-2.0, 4.0,  0>
  right     x*image_width/image_height
}

// An area light (creates soft shadows)
light_source {
  <0,0,0>             // light's position (translated below)
  color rgb 1.0       // light's color
  area_light
  <14, 0, 0> <0, 0, 14> // lights spread out across this distance (x * z)
  6, 6                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 4          // 0,1,2,3...
  jitter              // adds random softening of light
  circular            // make the shape of the light circular
  orient              // orient light
  translate <-40, 80, -40>   // <x y z> position of light
}

// create an Nth order infinite polynomial surface
// poly { N <a,b,c...> [sturm] }
// N = order of poly, M terms where M = (N+1)*(N+2)*(N+3)/6
poly {
  4, // order of polynomial (2...7)
  <
  // A_1 - A_10
  1,0,0,0,2,0,0,3,0,-17,
  // A_11 - A_20
  0,1,0,0,5,0,0,0,0,0,
  // A_21 - A_30
  //1,-1,-0.1,3.4,0,-17,0,0,0,0
  1,-1,-0.1,3.4,+clock,-17,0,0,0,0
  // A_31 - A_35
  1,0,-17,0,3*16+22
  >
  //sturm // optional, slower but reduces speckles 
            texture{ pigment{ color rgb< 0.2, 0.2, 1> } //  color White
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 0.4 reflection 0.00 ambient 0.2}
                 } // end of texture 
  rotate <10,-15,10>
  translate <0,5,0>

}
  
sphere
{                                    
<0,0,0>,2
texture{ pigment{ color rgb< 1, 0.1, 0.1> } //  color White
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 0.3 reflection 0.00 ambient 0.2}
                 } // end of texture 
  translate <0,5,0>
}                                 
                                   
plane { <0,1,0>, 0  hollow // normal vector, distance to zero ----

        texture{ pigment{ color rgb<0.35,0.60, 0.00> }
	         
                 finish { phong 0.3 reflection 0.2 }
               } // end of texture
        scale < 1, 1, 1>       
        translate<2,0.0,0>
      } 
                                   