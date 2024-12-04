with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with List;

package TotientLib is
    function Totient (n : Positive) return Positive;
private
   type Factor is record
      base : Positive := 1;
      exponent : Positive := 1;
   end record;
   procedure Init (X : out Factor; b, e : Positive);
   function Repr (X : Factor) return String;

   package FactorListLib is new List (T => Factor, ElemRepr => Repr); use FactorListLib;
   subtype FactorList is FactorListLib.ListType;

   function Factorise (n : Positive) return FactorList;
end TotientLib;
