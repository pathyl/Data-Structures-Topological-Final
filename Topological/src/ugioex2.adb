-- in file usegioex2.adb.  Use of Venus units for measurement.
-- These operations are required for our human mission to Venus.

with Ada.Text_IO; use Ada.Text_io;
with GIOEX;

procedure UseGioex2 is
    package MyIntIO is new Ada.Text_IO.Integer_IO(Integer);
    package MyFloatIO is new Ada.Text_IO.Float_IO(Float);

    type VenusMeasure is record
        F1: Integer;
        F2: Float;
    end record;

   -- Define I/O for VenusMeasurement.
   procedure Put(v: VenusMeasure) is
   begin
      MyIntIO.put(v.F1);
      put(" ");
      MyFloatIO.put(v.F2);
      new_line;
   end;

   -- Define mutliplication for VenusMeasurement.   
   function "*"(p1: VenusMeasure; p2: VenusMeasure) 
return VenusMeasure is
      temp: VenusMeasure;
   begin
      temp.F1 := p1.F1 * p2.F1;
      temp.F2 := p1.F2 * p2.F2;
      return temp;
   end;

   package MyVenusRectangle 
is new GIOEX(VenusMeasure, "*",  Put);
   use MyVenusRectangle;

   width: VenusMeasure := ( 5, 5.5);
   height: VenusMeasure := (3, 2.4);

   Rect1: Rectangle := (width, height);  -- Creates a rectangle using
                                                             -- Venus measurements.
   Ans: VenusMeasure;

begin
   Ans := Size( Rect1 );
end UseGIOEx2;
