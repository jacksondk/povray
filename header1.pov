// +H200 +W846  

#include "colors.inc"

plane { <0,1,0>, 0  hollow // normal vector, distance to zero ----

        texture{ pigment{ color rgb<1,1, 1> } } // end of texture
        scale < 1, 1, 1>
  
        translate<0,0.0,0>
      } // end of plane ------------------------------------------

// perspective (default) camera
camera {
  location  <0.0, 10.0, 0.0>
  look_at   <0.0, 0.0,  0.0>
  right     x*image_width/image_height
}

// create a regular point light source
light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <-20, 40, -40>
}
// create a regular point light source
light_source {
  0*x                  // light's position (translated below)
  color rgb <1,1,1>    // light's color
  translate <60, 40, -40>
}
                   
//--------------------------------------------------------------------------
#macro Ball(deg) //----------------------------------------------------------

sphere{ <0,0,0>, 0.25

        texture { pigment{ color CHSV2RGB(<deg, 1,1,0.80,0>)}// 0.35, 0.00>*0.9 }
                   finish { phong 1.0  reflection{ 0.05 metallic 0.3} }
                } // end of texture

        scale<1,1,1>  rotate<0,0,0>  translate<0,0,0>
      }
#end       // end of sphere ---------------------------------------------------
//--------------------------------------------------------------------------


//------------------------------------ 
#declare R_major = 3.50;
#declare R_minor = 1.00;
#declare R_inner = 0.80;
#declare N_maj = 10;
#declare N_min = 50;
#declare N_in  = 10;
//------------------------------------
union{
#declare Nr = 0;             //start
#declare EndNr=N_maj*N_min;//end
#while (Nr < EndNr)
object{Ball(Nr * 360/EndNr)
       translate<R_minor,0,0>
       rotate<0,0,Nr * 360/N_min>
       translate<R_major,0,0>
       rotate<0,Nr * 360/EndNr,0>}
 #declare Nr = Nr+1;  // next Nr
#end // ---------- end of loop -------

scale<2,1,0.7>
rotate<0,0,0>
translate<5,2,0>      
} // end of union
//------------------------------------
//------------------------------------

                   