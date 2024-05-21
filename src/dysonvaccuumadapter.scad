 // Dyson hand vaccuum adapter for vaccuum zip locks

diameter1 = 34.2;
diameter2 = 31.5;
wall_thickness = 2.34;
innerdiameter1 = diameter1 - (wall_thickness *2);
innerdiameter2 = innerdiameter1 + (diameter1 - diameter2) / 2;

$fn=200;

difference()
{
    //cylinder(h=40,r=diameter1/2);
    translate([0, 0, 0])
    {
        Rounded_tube(40,  diameter1/2, wall_thickness);
    }
    translate([0,0,10])
    {
        ring();
    }
    
}

module ring()
{

    difference()
    {
        cylinder(h=6,r=(diameter1/2)+1);
        translate([0,0,-1])
        {
            cylinder(h=8,r=innerdiameter2/2);
        }
    }
    
}

module Rounded_tube(height, radius, wall_thickness)
{
	ff = 0.05;		// CSG fudge factor

	// upper toroidal lip
	//translate([0, 0, height-wall_thickness*1.5])
	//	rotate_extrude()
	//		translate([radius-wall_thickness/2, 0, 0])
	//			circle(d=wall_thickness);

	// lower toroidal lip
	translate([0, 0, wall_thickness/2])
		rotate_extrude()
			translate([radius-wall_thickness/2, 0, 0])
				circle(d=wall_thickness);

	// bridge it with a tube
    translate([0, 0, wall_thickness/2])
	difference()
	{
		cylinder(h=height-2*wall_thickness, r=radius);
		cylinder(h=height, r=radius-wall_thickness);
	}
}


