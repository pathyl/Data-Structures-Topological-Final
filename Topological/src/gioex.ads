generic
    type MyType is private;
    with function "*"(X,Y: MyType) return MyType;
    with procedure Put(X: MyType);
package GIOEX is
  type Rectangle is tagged
    record
      Length:   MyType;
      Width:    MyType;
    end record;
  function Size(r: in Rectangle) return MyType;  -- intrinsic functions
  function RectLength(r: in Rectangle) return MyType;
end GIOEX;
