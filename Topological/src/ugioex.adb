-- Sample program to show how to pass a programmer defined data type 
--  and I/O methods to a generic.
-- in file UGIOEX.adb

with GIOEX; 
with Ada.Text_IO; -- Use Ada.Text_IO;
procedure UGIOEX is

  package MyFloatIO is new Ada.Text_IO.Float_IO(Float);
  use MyFloatIO;

--The generic put statement format in Ada.Text_IO.Float_IO.

--  procedure Put( item: float;
--                 fore: Ada.Text_IO.field := 0;      == "0" means use minimum space.
--                 aft:  Ada.Text_IO.Field := 0;
--                 exp:  Ada.Text_IO.Field := 0
-- );

--  Supply an overload for the generic written by the compiler in MyFloat_IO.
  procedure MyPut(X: Float) is
   begin    MyFloatIO.Put(X, 0, 0, 0);  end;
   
   -- Note that "*" is defined for the intrinsic type Float.
  package MyGIOEX is new GIOEX( Float, "*", MyPut);
  use MyGIOEX;

  Rect1: Rectangle := (5.0, 6.0);  //Create class object using constructor!
  Len: Float;

begin
  Len := Size(Rect1);  Len := RectLength(Rect1);
end UGIOEX;
