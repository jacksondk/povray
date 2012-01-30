// Persistence of Vision Ray Tracer Scene Description File
// File: mj1.pov
// Vers: 3.6
// Desc: Photon Scene Template with modifications
//

#version 3.6;

#declare Photons=on;

global_settings {
  assumed_gamma 1.0
  max_trace_level 5
  #if (Photons)          // global photon block
    photons {
      spacing 0.01                 // specify the density of photons
      //count 100000               // alternatively use a total number of photons

      //gather min, max            // amount of photons gathered during render [20, 100]
      //media max_steps [,factor]  // media photons
      jitter 1.0                 // jitter phor photon rays
      //max_trace_level 5          // optional separate max_trace_level
      //adc_bailout 1/255          // see global adc_bailout
      //save_file "filename"       // save photons to file
      //load_file "filename"       // load photons from file
      //autostop 0                 // photon autostop option
      //radius 10                  // manually specified search radius
      // (---Adaptive Search Radius---)
      //steps 1
      //expand_thresholds 0.2, 40
    }

  #end
}

// ----------------------------------------

camera {
  right x*image_width/image_height
  location  <0,5.6,-4>
  look_at   <0,0.75,0>
}

light_source {
  <500,500,150>       // light's position
  color rgb 0.4       // light's color
  photons {           // photon block for a light source
    refraction on
    reflection on
  }
}

light_source {
  <-500,500,150>       // light's position
  color rgb 1.3       // light's color
  photons {           // photon block for a light source
    refraction on
    reflection on
  }
}


sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}

// ----------------------------------------

plane {
  y, 0
  texture {
    pigment { color rgb <0.9, 0.7, 0.5> }
  }
}


#declare M_Glass=    // Glass material
material {
  texture {
    pigment {rgbt 1}
    finish {
      ambient 0.0
      diffuse 0.05
      specular 0.6
      roughness 0.005
      reflection {
        0.1, 1.0
        fresnel on
      }
      conserve_energy
    }
  }
  interior {
    ior 1.5
    fade_power 1001
    fade_distance 0.9
    fade_color <0.5,0.8,0.6>      
    refraction 1.6
  }
}
  
  
  
blob
{               
  threshold 0.1
  
  #declare Count=0;
  #declare MaxCount=10;
  #while (Count < MaxCount)
    sphere { <cos(Count/MaxCount*2*pi)*2,1,sin(Count/MaxCount*2*pi)*2>, 1, 0.9 }
    #declare Count = Count + 1;
  #end
  
sphere {                       

  <0,1,0>, 1, 3  
}


sphere {
  <1,1,0>, 0.9, 3  
 
}
sphere {
  <-1,1,0>, 0.8, 1
}

sphere {
  <-2,1,0>, 1, 1
}

sphere {
  <-3.2,1,0>, 0.6, 1  
}

sphere {
  <-4.2,1,0>, 0.6, 1  
}

 material { M_Glass }

  photons {  // photon block for an object
    target 1.0
    refraction on
    reflection on
  }               
  rotate <0,-45,0>
  translate <1.3,0,1.0>
}
