package MyTypes is

   type Parent;
   type ParentPtr is access all Parent'Class;
   type Parent is tagged record
      next: ParentPtr;
   end record;
   
   type IntegerType is new Parent with
      record
         integerValue: integer;
      end record;

   type MyTypeArray is array(integer range <>) of ParentPtr;
   function get(Job:  out Integer) return ParentPtr;
   procedure put(Job:  in Integer);

end MyTypes;
