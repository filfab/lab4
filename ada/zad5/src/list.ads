with Ada.Unchecked_Deallocation;

generic
   type T is private;
   with function ElemRepr (X : T) return String;
package List is
   EmptyListError : exception;
   IndexError : exception;

   type ListType is private;

   type Index is new Integer;
   procedure Get(X : out Index; l : ListType; prompt : String := "");


   function IsEmpty (l : ListType) return Boolean;

   function Pop (l : in out ListType) return T;
   procedure Push (l : in out ListType; e : T);
   procedure Append (l : in out ListType; e : T);

   function Get (l : ListType; i : Index) return T;
   procedure Put (l : in out ListType; i : Index; e : T);
   procedure Insert (l : in out ListType; i : Index; e : T);
   procedure Delete (l : in out ListType; i : Index);

   procedure Print (l : ListType);
   procedure Clean (l : in out ListType);
   function Length (l : ListType) return Integer;
private

   type Node;
   type NodePtr is access Node;
   type Node is record
      elem : T;
      next : NodePtr := null;
   end record;

   type ListType is record
      first : NodePtr := null;
      last : NodePtr := null;
      length : Integer := 0;
   end record;

   function Find (l : ListType; i : Index) return NodePtr;

   procedure Free is new Standard.Ada.Unchecked_Deallocation (Node, NodePtr);
end List;
