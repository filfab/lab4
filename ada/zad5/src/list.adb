with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.IO_Exceptions; use Ada.IO_Exceptions;

package body List is

   procedure Get (X : out Index; l : ListType; prompt : String := "") is
      i : Integer;
   begin
      Put(prompt);
      Get(i);
      Skip_Line;
      if (i > 0 and i <= Length(l))
      or (i < 0 and i >= -Length(l)+1) then
         raise IndexError;
      end if;
      X := Index'Val(i);
   exception
      when Ada.IO_Exceptions.Data_Error => raise IndexError;
   end Get;

   function IsEmpty (l : ListType) return Boolean is
   begin
      return l.length = 0;
   end IsEmpty;

   function Pop (l : in out ListType) return T is
      n : NodePtr;
      e : T;
   begin
      if l.length = 0 then raise EmptyListError; end if;
      n := l.first;
      e := n.elem;
      l.first := n.next;
      if l.last = null then -- last element
         l.last := null;
      end if;
      Free(n);
      l.length := l.length - 1;
      return e;
   end Pop;

   procedure Push (l : in out ListType; e : T) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      n.next := l.first;
      l.first := n;
      if l.last = null then -- first element
         l.last := n;
      end if;
      l.length := l.length + 1;
   end Push;

   procedure Append (l : in out ListType; e : T) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      if l.first = null then -- first element
         l.first := n;
      else
         l.last.next := n;
      end if;
      l.last := n;
      l.length := l.length + 1;
   end Append;

   function Get (l : ListType; i : Index) return T is
      n : NodePtr := Find(l, i);
   begin
      return n.elem;
   end Get;
   
   procedure Put (l : in out ListType; i : Index; e : T) is
      n : NodePtr := Find(l, i);
   begin
      n.elem := e;
   end Put;

   procedure Insert (l : in out ListType; i : Index; e : T) is
      nn : NodePtr;
      on : NodePtr;
   begin
      if i = 1 then
         Push(l, e);
      elsif i = Index'Val(l.length+1) then
         Append(l, e);
      else
         nn := new Node;
         on := Find(l, i-1);
         nn.elem := e;
         nn.next := on.next;
         on.next := nn;
         l.length := l.length + 1;
      end if;
   end Insert;

   procedure Delete (l : in out ListType; i : Index) is
      pn : NodePtr := Find(l, i-1);
      n : NodePtr := pn.next;
      discard : T;
   begin
      if i = 1 then
         discard := Pop(l);
      else
         pn.next := null;
         if  i = Index'Val(l.length) then
            l.last := pn;
         end if;
         Free(n);
         l.length := l.length - 1;
      end if;
   end Delete;

   procedure Print (l : ListType) is
      n : NodePtr := l.first;
   begin
      while n /= null loop
         Put(ElemRepr(n.elem) & " ");
         n := n.next;
      end loop;
      Put_Line("|" & l.length'Image);
   end Print;

   procedure Clean (l : in out ListType) is
      discard : T;
   begin
      while not IsEmpty(l) loop
         discard := Pop(l);
      end loop;
   end Clean;

   function Length (l : ListType) return Integer is
   begin
      return l.length;
   end Length;

   function Find (l : ListType; i : Index) return NodePtr is
      n : NodePtr := l.first;
      ii : Integer := Integer'Val(i);
   begin
      if ii = -1 or ii = l.length then
         n := l.last;
      elsif ii < -1 then
         ii := l.length + ii + 1;
      end if;
      for j in 1..(ii-1) loop
         n := n.next;
      end loop;
      return n;
   end Find;
end List;
