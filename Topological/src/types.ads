--types.ads
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
package types is

   type Parent;
   type ParentPtr is access Parent;
   type Parent is tagged record
      next: ParentPtr;
   end record;
   type fruitEnum is (apple, banana, orange, pear);
   type Food is new Parent with
      record
         foodType: fruitEnum;
         calories: float;
      end record;
   type NameType is (Mary, Joe, Tom, Bob, Sara, Julie, Larry, Sam);
   type nameEnum is (Bennett, Burris, Cooper, Joe);
   type classEnum is (warrior, sorceror, wizard);

   type Person is new Parent with
      record
         name: NameEnum;
         personClass: classEnum;
      end record;

   type CarBrandEnum is (GMC, Chevy, Ford, Buick, Jeep, Dodge);

   type Car is new Parent with
      record
         carType: CarBrandEnum;
         numDoors: integer;
      end record;
   type IntegerType is new Parent with
      record
         integerValue: integer;
      end record;
   procedure temp;
   procedure Identify(Object: in out Unbounded_String);
   function FoodConstructor(Object: in out Unbounded_String) return Food;
end types;
