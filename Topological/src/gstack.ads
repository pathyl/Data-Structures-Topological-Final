generic                       -- in file Gstack.ads
  max:integer;             -- size of stack
  type item is private;  -- type to stack
package gstack is
	procedure push(x: in item);
	procedure pop(x: out item);
end gstack;
