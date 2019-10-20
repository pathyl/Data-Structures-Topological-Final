with Ada.Text_IO;
use ada.Text_IO;
with mytypes;
use mytypes;

package FileReader is

   procedure ReadLines(Arr: in out MyTypeArray);
   function NumItems return Integer;
end FileReader;
