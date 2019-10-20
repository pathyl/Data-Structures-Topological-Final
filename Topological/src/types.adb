with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
use Ada.Text_IO.Unbounded_IO;
with Ada.Unchecked_Deallocation;

package body types is

  
   procedure Free is new Ada.Unchecked_Deallocation(Parent, ParentPtr);
   
   package NameIO is new Ada.Text_IO.Enumeration_IO(NameType);
   package FruitIO is new Ada.Text_IO.Enumeration_IO(fruitEnum);
   package PersonIO is new Ada.Text_IO.Enumeration_IO(nameEnum);
   package CarIO is new Ada.Text_IO.Enumeration_IO(CarBrandEnum);
   package IntegerIO is new Ada.Text_IO.Integer_IO(Integer);
   
   procedure put(Job: in IntegerType) is
   begin
      IntegerIO.Put(Job);
   end;

      procedure put(Job: in Car) is
   begin
      CarIO.put(Job);
   end;

      procedure put(Job: in Food) is
   begin
      Put_Line("Food");
   end;

      procedure put(Job: in Person) is
   begin
      Put_Line("Person");
   end;

   procedure put(Job: in NameType) is
   begin
      Put_Line("Name Type");
   end;
   
   procedure temp is
      x: integer;
   begin
      x:=1;
   end temp;
   
   procedure Identify(Object: in out Unbounded_String) is
      Obj : String := To_String(Object);
      Which_Type: Unbounded_String;
   begin
      --Will be passed an object in the form (objecttype,attr1,attr2,...)
      Put_Line("Handed");
      Put_Line(Object);
      for i in Obj'Range loop
         if Obj(i) = ',' then
            Which_Type := Unbounded_Slice(Object,2,i-1);
            Object := Unbounded_Slice(Object,i+1, Obj'Last-1);
            goto Ex;
         end if;
      end loop;
      <<Ex>>
      Put_Line("OBJECT");
      Put_Line(Object);

     
      
   end Identify;
   
   function FoodConstructor(Object: in out Unbounded_String) return Food is
            F: Food;
   begin
      Put_Line("InsideFoodConstructor");

      return F;
   end FoodConstructor;
   
   
   
end types;
