-----------------------------------------------------------------------
--  AWA.Audits.Models -- AWA.Audits.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-body.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2018 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------
with Ada.Unchecked_Deallocation;
with Util.Beans.Objects.Time;
package body AWA.Audits.Models is

   use type ADO.Objects.Object_Record_Access;
   use type ADO.Objects.Object_Ref;

   pragma Warnings (Off, "formal parameter * is not referenced");

   function Audit_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => AUDIT_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Audit_Key;

   function Audit_Key (Id : in String) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => AUDIT_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Audit_Key;

   function "=" (Left, Right : Audit_Ref'Class) return Boolean is
   begin
      return ADO.Objects.Object_Ref'Class (Left) = ADO.Objects.Object_Ref'Class (Right);
   end "=";

   procedure Set_Field (Object : in out Audit_Ref'Class;
                        Impl   : out Audit_Access) is
      Result : ADO.Objects.Object_Record_Access;
   begin
      Object.Prepare_Modify (Result);
      Impl := Audit_Impl (Result.all)'Access;
   end Set_Field;

   --  Internal method to allocate the Object_Record instance
   procedure Allocate (Object : in out Audit_Ref) is
      Impl : Audit_Access;
   begin
      Impl := new Audit_Impl;
      Impl.Date := ADO.DEFAULT_TIME;
      Impl.Old_Value.Is_Null := True;
      Impl.New_Value.Is_Null := True;
      Impl.Entity_Id := ADO.NO_IDENTIFIER;
      Impl.Entity_Type := 0;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Allocate;

   -- ----------------------------------------
   --  Data object: Audit
   -- ----------------------------------------

   procedure Set_Id (Object : in out Audit_Ref;
                     Value  : in ADO.Identifier) is
      Impl : Audit_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Key_Value (Impl.all, 1, Value);
   end Set_Id;

   function Get_Id (Object : in Audit_Ref)
                  return ADO.Identifier is
      Impl : constant Audit_Access
         := Audit_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Get_Key_Value;
   end Get_Id;


   procedure Set_Date (Object : in out Audit_Ref;
                       Value  : in Ada.Calendar.Time) is
      Impl : Audit_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Time (Impl.all, 2, Impl.Date, Value);
   end Set_Date;

   function Get_Date (Object : in Audit_Ref)
                  return Ada.Calendar.Time is
      Impl : constant Audit_Access
         := Audit_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Date;
   end Get_Date;


   procedure Set_Old_Value (Object : in out Audit_Ref;
                             Value : in String) is
      Impl : Audit_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 3, Impl.Old_Value, Value);
   end Set_Old_Value;

   procedure Set_Old_Value (Object : in out Audit_Ref;
                            Value  : in ADO.Nullable_String) is
      Impl : Audit_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 3, Impl.Old_Value, Value);
   end Set_Old_Value;

   function Get_Old_Value (Object : in Audit_Ref)
                 return String is
      Value : constant ADO.Nullable_String := Object.Get_Old_Value;
   begin
      if Value.Is_Null then
         return "";
      else
         return Ada.Strings.Unbounded.To_String (Value.Value);
      end if;
   end Get_Old_Value;
   function Get_Old_Value (Object : in Audit_Ref)
                  return ADO.Nullable_String is
      Impl : constant Audit_Access
         := Audit_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Old_Value;
   end Get_Old_Value;


   procedure Set_New_Value (Object : in out Audit_Ref;
                             Value : in String) is
      Impl : Audit_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 4, Impl.New_Value, Value);
   end Set_New_Value;

   procedure Set_New_Value (Object : in out Audit_Ref;
                            Value  : in ADO.Nullable_String) is
      Impl : Audit_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 4, Impl.New_Value, Value);
   end Set_New_Value;

   function Get_New_Value (Object : in Audit_Ref)
                 return String is
      Value : constant ADO.Nullable_String := Object.Get_New_Value;
   begin
      if Value.Is_Null then
         return "";
      else
         return Ada.Strings.Unbounded.To_String (Value.Value);
      end if;
   end Get_New_Value;
   function Get_New_Value (Object : in Audit_Ref)
                  return ADO.Nullable_String is
      Impl : constant Audit_Access
         := Audit_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.New_Value;
   end Get_New_Value;


   procedure Set_Entity_Id (Object : in out Audit_Ref;
                            Value  : in ADO.Identifier) is
      Impl : Audit_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Identifier (Impl.all, 5, Impl.Entity_Id, Value);
   end Set_Entity_Id;

   function Get_Entity_Id (Object : in Audit_Ref)
                  return ADO.Identifier is
      Impl : constant Audit_Access
         := Audit_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Entity_Id;
   end Get_Entity_Id;


   procedure Set_Session (Object : in out Audit_Ref;
                          Value  : in AWA.Users.Models.Session_Ref'Class) is
      Impl : Audit_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Object (Impl.all, 6, Impl.Session, Value);
   end Set_Session;

   function Get_Session (Object : in Audit_Ref)
                  return AWA.Users.Models.Session_Ref'Class is
      Impl : constant Audit_Access
         := Audit_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Session;
   end Get_Session;


   procedure Set_Entity_Type (Object : in out Audit_Ref;
                              Value  : in ADO.Entity_Type) is
      Impl : Audit_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Entity_Type (Impl.all, 7, Impl.Entity_Type, Value);
   end Set_Entity_Type;

   function Get_Entity_Type (Object : in Audit_Ref)
                  return ADO.Entity_Type is
      Impl : constant Audit_Access
         := Audit_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Entity_Type;
   end Get_Entity_Type;

   --  Copy of the object.
   procedure Copy (Object : in Audit_Ref;
                   Into   : in out Audit_Ref) is
      Result : Audit_Ref;
   begin
      if not Object.Is_Null then
         declare
            Impl : constant Audit_Access
              := Audit_Impl (Object.Get_Load_Object.all)'Access;
            Copy : constant Audit_Access
              := new Audit_Impl;
         begin
            ADO.Objects.Set_Object (Result, Copy.all'Access);
            Copy.Copy (Impl.all);
            Copy.Date := Impl.Date;
            Copy.Old_Value := Impl.Old_Value;
            Copy.New_Value := Impl.New_Value;
            Copy.Entity_Id := Impl.Entity_Id;
            Copy.Session := Impl.Session;
            Copy.Entity_Type := Impl.Entity_Type;
         end;
      end if;
      Into := Result;
   end Copy;

   procedure Find (Object  : in out Audit_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Impl  : constant Audit_Access := new Audit_Impl;
   begin
      Impl.Find (Session, Query, Found);
      if Found then
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      else
         ADO.Objects.Set_Object (Object, null);
         Destroy (Impl);
      end if;
   end Find;

   procedure Load (Object  : in out Audit_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier) is
      Impl  : constant Audit_Access := new Audit_Impl;
      Found : Boolean;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
         raise ADO.Objects.NOT_FOUND;
      end if;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Load;

   procedure Load (Object  : in out Audit_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean) is
      Impl  : constant Audit_Access := new Audit_Impl;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
      else
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      end if;
   end Load;

   procedure Save (Object  : in out Audit_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl = null then
         Impl := new Audit_Impl;
         ADO.Objects.Set_Object (Object, Impl);
      end if;
      if not ADO.Objects.Is_Created (Impl.all) then
         Impl.Create (Session);
      else
         Impl.Save (Session);
      end if;
   end Save;

   procedure Delete (Object  : in out Audit_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : constant ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl /= null then
         Impl.Delete (Session);
      end if;
   end Delete;

   --  --------------------
   --  Free the object
   --  --------------------
   procedure Destroy (Object : access Audit_Impl) is
      type Audit_Impl_Ptr is access all Audit_Impl;
      procedure Unchecked_Free is new Ada.Unchecked_Deallocation
              (Audit_Impl, Audit_Impl_Ptr);
      pragma Warnings (Off, "*redundant conversion*");
      Ptr : Audit_Impl_Ptr := Audit_Impl (Object.all)'Access;
      pragma Warnings (On, "*redundant conversion*");
   begin
      Unchecked_Free (Ptr);
   end Destroy;

   procedure Find (Object  : in out Audit_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Query, AUDIT_DEF'Access);
   begin
      Stmt.Execute;
      if Stmt.Has_Elements then
         Object.Load (Stmt, Session);
         Stmt.Next;
         Found := not Stmt.Has_Elements;
      else
         Found := False;
      end if;
   end Find;

   overriding
   procedure Load (Object  : in out Audit_Impl;
                   Session : in out ADO.Sessions.Session'Class) is
      Found : Boolean;
      Query : ADO.SQL.Query;
      Id    : constant ADO.Identifier := Object.Get_Key_Value;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Object.Find (Session, Query, Found);
      if not Found then
         raise ADO.Objects.NOT_FOUND;
      end if;
   end Load;

   procedure Save (Object  : in out Audit_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Update_Statement
         := Session.Create_Statement (AUDIT_DEF'Access);
   begin
      if Object.Is_Modified (1) then
         Stmt.Save_Field (Name  => COL_0_1_NAME, --  id
                          Value => Object.Get_Key);
         Object.Clear_Modified (1);
      end if;
      if Object.Is_Modified (2) then
         Stmt.Save_Field (Name  => COL_1_1_NAME, --  date
                          Value => Object.Date);
         Object.Clear_Modified (2);
      end if;
      if Object.Is_Modified (3) then
         Stmt.Save_Field (Name  => COL_2_1_NAME, --  old_value
                          Value => Object.Old_Value);
         Object.Clear_Modified (3);
      end if;
      if Object.Is_Modified (4) then
         Stmt.Save_Field (Name  => COL_3_1_NAME, --  new_value
                          Value => Object.New_Value);
         Object.Clear_Modified (4);
      end if;
      if Object.Is_Modified (5) then
         Stmt.Save_Field (Name  => COL_4_1_NAME, --  entity_id
                          Value => Object.Entity_Id);
         Object.Clear_Modified (5);
      end if;
      if Object.Is_Modified (6) then
         Stmt.Save_Field (Name  => COL_5_1_NAME, --  session_id
                          Value => Object.Session);
         Object.Clear_Modified (6);
      end if;
      if Object.Is_Modified (7) then
         Stmt.Save_Field (Name  => COL_6_1_NAME, --  entity_type
                          Value => Object.Entity_Type);
         Object.Clear_Modified (7);
      end if;
      if Stmt.Has_Save_Fields then
         Stmt.Set_Filter (Filter => "id = ?");
         Stmt.Add_Param (Value => Object.Get_Key);
         declare
            Result : Integer;
         begin
            Stmt.Execute (Result);
            if Result /= 1 then
               if Result /= 0 then
                  raise ADO.Objects.UPDATE_ERROR;
               end if;
            end if;
         end;
      end if;
   end Save;

   procedure Create (Object  : in out Audit_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Query : ADO.Statements.Insert_Statement
                  := Session.Create_Statement (AUDIT_DEF'Access);
      Result : Integer;
   begin
      Session.Allocate (Id => Object);
      Query.Save_Field (Name  => COL_0_1_NAME, --  id
                        Value => Object.Get_Key);
      Query.Save_Field (Name  => COL_1_1_NAME, --  date
                        Value => Object.Date);
      Query.Save_Field (Name  => COL_2_1_NAME, --  old_value
                        Value => Object.Old_Value);
      Query.Save_Field (Name  => COL_3_1_NAME, --  new_value
                        Value => Object.New_Value);
      Query.Save_Field (Name  => COL_4_1_NAME, --  entity_id
                        Value => Object.Entity_Id);
      Query.Save_Field (Name  => COL_5_1_NAME, --  session_id
                        Value => Object.Session);
      Query.Save_Field (Name  => COL_6_1_NAME, --  entity_type
                        Value => Object.Entity_Type);
      Query.Execute (Result);
      if Result /= 1 then
         raise ADO.Objects.INSERT_ERROR;
      end if;
      ADO.Objects.Set_Created (Object);
   end Create;

   procedure Delete (Object  : in out Audit_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Delete_Statement
         := Session.Create_Statement (AUDIT_DEF'Access);
   begin
      Stmt.Set_Filter (Filter => "id = ?");
      Stmt.Add_Param (Value => Object.Get_Key);
      Stmt.Execute;
   end Delete;

   --  ------------------------------
   --  Get the bean attribute identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in Audit_Ref;
                       Name : in String) return Util.Beans.Objects.Object is
      Obj  : ADO.Objects.Object_Record_Access;
      Impl : access Audit_Impl;
   begin
      if From.Is_Null then
         return Util.Beans.Objects.Null_Object;
      end if;
      Obj := From.Get_Load_Object;
      Impl := Audit_Impl (Obj.all)'Access;
      if Name = "id" then
         return ADO.Objects.To_Object (Impl.Get_Key);
      elsif Name = "date" then
         return Util.Beans.Objects.Time.To_Object (Impl.Date);
      elsif Name = "old_value" then
         if Impl.Old_Value.Is_Null then
            return Util.Beans.Objects.Null_Object;
         else
            return Util.Beans.Objects.To_Object (Impl.Old_Value.Value);
         end if;
      elsif Name = "new_value" then
         if Impl.New_Value.Is_Null then
            return Util.Beans.Objects.Null_Object;
         else
            return Util.Beans.Objects.To_Object (Impl.New_Value.Value);
         end if;
      elsif Name = "entity_id" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (Impl.Entity_Id));
      elsif Name = "entity_type" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (Impl.Entity_Type));
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;


   procedure List (Object  : in out Audit_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class) is
      Stmt : ADO.Statements.Query_Statement
        := Session.Create_Statement (Query, AUDIT_DEF'Access);
   begin
      Stmt.Execute;
      Audit_Vectors.Clear (Object);
      while Stmt.Has_Elements loop
         declare
            Item : Audit_Ref;
            Impl : constant Audit_Access := new Audit_Impl;
         begin
            Impl.Load (Stmt, Session);
            ADO.Objects.Set_Object (Item, Impl.all'Access);
            Object.Append (Item);
         end;
         Stmt.Next;
      end loop;
   end List;

   --  ------------------------------
   --  Load the object from current iterator position
   --  ------------------------------
   procedure Load (Object  : in out Audit_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class) is
   begin
      Object.Set_Key_Value (Stmt.Get_Identifier (0));
      Object.Date := Stmt.Get_Time (1);
      Object.Old_Value := Stmt.Get_Nullable_String (2);
      Object.New_Value := Stmt.Get_Nullable_String (3);
      Object.Entity_Id := Stmt.Get_Identifier (4);
      if not Stmt.Is_Null (5) then
         Object.Session.Set_Key_Value (Stmt.Get_Identifier (5), Session);
      end if;
      Object.Entity_Type := ADO.Entity_Type (Stmt.Get_Integer (6));
      ADO.Objects.Set_Created (Object);
   end Load;


end AWA.Audits.Models;
