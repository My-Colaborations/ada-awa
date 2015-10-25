-----------------------------------------------------------------------
--  AWA.Comments.Models -- AWA.Comments.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-body.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2015 Stephane Carrez
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
with ASF.Events.Faces.Actions;
package body AWA.Comments.Models is

   use type ADO.Objects.Object_Record_Access;
   use type ADO.Objects.Object_Ref;
   use type ADO.Objects.Object_Record;

   function Comment_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => COMMENT_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Comment_Key;

   function Comment_Key (Id : in String) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => COMMENT_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Comment_Key;

   function "=" (Left, Right : Comment_Ref'Class) return Boolean is
   begin
      return ADO.Objects.Object_Ref'Class (Left) = ADO.Objects.Object_Ref'Class (Right);
   end "=";

   procedure Set_Field (Object : in out Comment_Ref'Class;
                        Impl   : out Comment_Access) is
      Result : ADO.Objects.Object_Record_Access;
   begin
      Object.Prepare_Modify (Result);
      Impl := Comment_Impl (Result.all)'Access;
   end Set_Field;

   --  Internal method to allocate the Object_Record instance
   procedure Allocate (Object : in out Comment_Ref) is
      Impl : Comment_Access;
   begin
      Impl := new Comment_Impl;
      Impl.Create_Date := ADO.DEFAULT_TIME;
      Impl.Entity_Id := ADO.NO_IDENTIFIER;
      Impl.Version := 0;
      Impl.Entity_Type := 0;
      Impl.Status := AWA.Comments.Models.Status_Type'First;
      Impl.Format := AWA.Comments.Models.Format_Type'First;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Allocate;

   -- ----------------------------------------
   --  Data object: Comment
   -- ----------------------------------------

   procedure Set_Create_Date (Object : in out Comment_Ref;
                              Value  : in Ada.Calendar.Time) is
      Impl : Comment_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Time (Impl.all, 1, Impl.Create_Date, Value);
   end Set_Create_Date;

   function Get_Create_Date (Object : in Comment_Ref)
                  return Ada.Calendar.Time is
      Impl : constant Comment_Access
         := Comment_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Create_Date;
   end Get_Create_Date;


   procedure Set_Message (Object : in out Comment_Ref;
                           Value : in String) is
      Impl : Comment_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 2, Impl.Message, Value);
   end Set_Message;

   procedure Set_Message (Object : in out Comment_Ref;
                          Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Comment_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 2, Impl.Message, Value);
   end Set_Message;

   function Get_Message (Object : in Comment_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Message);
   end Get_Message;
   function Get_Message (Object : in Comment_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Comment_Access
         := Comment_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Message;
   end Get_Message;


   procedure Set_Entity_Id (Object : in out Comment_Ref;
                            Value  : in ADO.Identifier) is
      Impl : Comment_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Identifier (Impl.all, 3, Impl.Entity_Id, Value);
   end Set_Entity_Id;

   function Get_Entity_Id (Object : in Comment_Ref)
                  return ADO.Identifier is
      Impl : constant Comment_Access
         := Comment_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Entity_Id;
   end Get_Entity_Id;


   procedure Set_Id (Object : in out Comment_Ref;
                     Value  : in ADO.Identifier) is
      Impl : Comment_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Key_Value (Impl.all, 4, Value);
   end Set_Id;

   function Get_Id (Object : in Comment_Ref)
                  return ADO.Identifier is
      Impl : constant Comment_Access
         := Comment_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Get_Key_Value;
   end Get_Id;


   function Get_Version (Object : in Comment_Ref)
                  return Integer is
      Impl : constant Comment_Access
         := Comment_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Version;
   end Get_Version;


   procedure Set_Entity_Type (Object : in out Comment_Ref;
                              Value  : in ADO.Entity_Type) is
      Impl : Comment_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Entity_Type (Impl.all, 6, Impl.Entity_Type, Value);
   end Set_Entity_Type;

   function Get_Entity_Type (Object : in Comment_Ref)
                  return ADO.Entity_Type is
      Impl : constant Comment_Access
         := Comment_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Entity_Type;
   end Get_Entity_Type;


   procedure Set_Status (Object : in out Comment_Ref;
                         Value  : in AWA.Comments.Models.Status_Type) is
      procedure Set_Field_Enum is
         new ADO.Objects.Set_Field_Operation (Status_Type);
      Impl : Comment_Access;
   begin
      Set_Field (Object, Impl);
      Set_Field_Enum (Impl.all, 7, Impl.Status, Value);
   end Set_Status;

   function Get_Status (Object : in Comment_Ref)
                  return AWA.Comments.Models.Status_Type is
      Impl : constant Comment_Access
         := Comment_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Status;
   end Get_Status;


   procedure Set_Format (Object : in out Comment_Ref;
                         Value  : in AWA.Comments.Models.Format_Type) is
      procedure Set_Field_Enum is
         new ADO.Objects.Set_Field_Operation (Format_Type);
      Impl : Comment_Access;
   begin
      Set_Field (Object, Impl);
      Set_Field_Enum (Impl.all, 8, Impl.Format, Value);
   end Set_Format;

   function Get_Format (Object : in Comment_Ref)
                  return AWA.Comments.Models.Format_Type is
      Impl : constant Comment_Access
         := Comment_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Format;
   end Get_Format;


   procedure Set_Author (Object : in out Comment_Ref;
                         Value  : in AWA.Users.Models.User_Ref'Class) is
      Impl : Comment_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Object (Impl.all, 9, Impl.Author, Value);
   end Set_Author;

   function Get_Author (Object : in Comment_Ref)
                  return AWA.Users.Models.User_Ref'Class is
      Impl : constant Comment_Access
         := Comment_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Author;
   end Get_Author;

   --  Copy of the object.
   procedure Copy (Object : in Comment_Ref;
                   Into   : in out Comment_Ref) is
      Result : Comment_Ref;
   begin
      if not Object.Is_Null then
         declare
            Impl : constant Comment_Access
              := Comment_Impl (Object.Get_Load_Object.all)'Access;
            Copy : constant Comment_Access
              := new Comment_Impl;
         begin
            ADO.Objects.Set_Object (Result, Copy.all'Access);
            Copy.Copy (Impl.all);
            Copy.Create_Date := Impl.Create_Date;
            Copy.Message := Impl.Message;
            Copy.Entity_Id := Impl.Entity_Id;
            Copy.Version := Impl.Version;
            Copy.Entity_Type := Impl.Entity_Type;
            Copy.Status := Impl.Status;
            Copy.Format := Impl.Format;
            Copy.Author := Impl.Author;
         end;
      end if;
      Into := Result;
   end Copy;

   procedure Find (Object  : in out Comment_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Impl  : constant Comment_Access := new Comment_Impl;
   begin
      Impl.Find (Session, Query, Found);
      if Found then
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      else
         ADO.Objects.Set_Object (Object, null);
         Destroy (Impl);
      end if;
   end Find;

   procedure Load (Object  : in out Comment_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier) is
      Impl  : constant Comment_Access := new Comment_Impl;
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

   procedure Load (Object  : in out Comment_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean) is
      Impl  : constant Comment_Access := new Comment_Impl;
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

   procedure Save (Object  : in out Comment_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl = null then
         Impl := new Comment_Impl;
         ADO.Objects.Set_Object (Object, Impl);
      end if;
      if not ADO.Objects.Is_Created (Impl.all) then
         Impl.Create (Session);
      else
         Impl.Save (Session);
      end if;
   end Save;

   procedure Delete (Object  : in out Comment_Ref;
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
   procedure Destroy (Object : access Comment_Impl) is
      type Comment_Impl_Ptr is access all Comment_Impl;
      procedure Unchecked_Free is new Ada.Unchecked_Deallocation
              (Comment_Impl, Comment_Impl_Ptr);
      pragma Warnings (Off, "*redundant conversion*");
      Ptr : Comment_Impl_Ptr := Comment_Impl (Object.all)'Access;
      pragma Warnings (On, "*redundant conversion*");
   begin
      Unchecked_Free (Ptr);
   end Destroy;

   procedure Find (Object  : in out Comment_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Query, COMMENT_DEF'Access);
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
   procedure Load (Object  : in out Comment_Impl;
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

   procedure Save (Object  : in out Comment_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Update_Statement
         := Session.Create_Statement (COMMENT_DEF'Access);
   begin
      if Object.Is_Modified (1) then
         Stmt.Save_Field (Name  => COL_0_1_NAME, --  create_date
                          Value => Object.Create_Date);
         Object.Clear_Modified (1);
      end if;
      if Object.Is_Modified (2) then
         Stmt.Save_Field (Name  => COL_1_1_NAME, --  message
                          Value => Object.Message);
         Object.Clear_Modified (2);
      end if;
      if Object.Is_Modified (3) then
         Stmt.Save_Field (Name  => COL_2_1_NAME, --  entity_id
                          Value => Object.Entity_Id);
         Object.Clear_Modified (3);
      end if;
      if Object.Is_Modified (4) then
         Stmt.Save_Field (Name  => COL_3_1_NAME, --  id
                          Value => Object.Get_Key);
         Object.Clear_Modified (4);
      end if;
      if Object.Is_Modified (6) then
         Stmt.Save_Field (Name  => COL_5_1_NAME, --  entity_type
                          Value => Object.Entity_Type);
         Object.Clear_Modified (6);
      end if;
      if Object.Is_Modified (7) then
         Stmt.Save_Field (Name  => COL_6_1_NAME, --  status
                          Value => Integer (Status_Type'Pos (Object.Status)));
         Object.Clear_Modified (7);
      end if;
      if Object.Is_Modified (8) then
         Stmt.Save_Field (Name  => COL_7_1_NAME, --  format
                          Value => Integer (Format_Type'Pos (Object.Format)));
         Object.Clear_Modified (8);
      end if;
      if Object.Is_Modified (9) then
         Stmt.Save_Field (Name  => COL_8_1_NAME, --  author_id
                          Value => Object.Author);
         Object.Clear_Modified (9);
      end if;
      if Stmt.Has_Save_Fields then
         Object.Version := Object.Version + 1;
         Stmt.Save_Field (Name  => "version",
                          Value => Object.Version);
         Stmt.Set_Filter (Filter => "id = ? and version = ?");
         Stmt.Add_Param (Value => Object.Get_Key);
         Stmt.Add_Param (Value => Object.Version - 1);
         declare
            Result : Integer;
         begin
            Stmt.Execute (Result);
            if Result /= 1 then
               if Result /= 0 then
                  raise ADO.Objects.UPDATE_ERROR;
               else
                  raise ADO.Objects.LAZY_LOCK;
               end if;
            end if;
         end;
      end if;
   end Save;

   procedure Create (Object  : in out Comment_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Query : ADO.Statements.Insert_Statement
                  := Session.Create_Statement (COMMENT_DEF'Access);
      Result : Integer;
   begin
      Object.Version := 1;
      Query.Save_Field (Name  => COL_0_1_NAME, --  create_date
                        Value => Object.Create_Date);
      Query.Save_Field (Name  => COL_1_1_NAME, --  message
                        Value => Object.Message);
      Query.Save_Field (Name  => COL_2_1_NAME, --  entity_id
                        Value => Object.Entity_Id);
      Session.Allocate (Id => Object);
      Query.Save_Field (Name  => COL_3_1_NAME, --  id
                        Value => Object.Get_Key);
      Query.Save_Field (Name  => COL_4_1_NAME, --  version
                        Value => Object.Version);
      Query.Save_Field (Name  => COL_5_1_NAME, --  entity_type
                        Value => Object.Entity_Type);
      Query.Save_Field (Name  => COL_6_1_NAME, --  status
                        Value => Integer (Status_Type'Pos (Object.Status)));
      Query.Save_Field (Name  => COL_7_1_NAME, --  format
                        Value => Integer (Format_Type'Pos (Object.Format)));
      Query.Save_Field (Name  => COL_8_1_NAME, --  author_id
                        Value => Object.Author);
      Query.Execute (Result);
      if Result /= 1 then
         raise ADO.Objects.INSERT_ERROR;
      end if;
      ADO.Objects.Set_Created (Object);
   end Create;

   procedure Delete (Object  : in out Comment_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Delete_Statement
         := Session.Create_Statement (COMMENT_DEF'Access);
   begin
      Stmt.Set_Filter (Filter => "id = ?");
      Stmt.Add_Param (Value => Object.Get_Key);
      Stmt.Execute;
   end Delete;

   --  ------------------------------
   --  Get the bean attribute identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in Comment_Ref;
                       Name : in String) return Util.Beans.Objects.Object is
      Obj  : constant ADO.Objects.Object_Record_Access := From.Get_Load_Object;
      Impl : access Comment_Impl;
   begin
      if Obj = null then
         return Util.Beans.Objects.Null_Object;
      end if;
      Impl := Comment_Impl (Obj.all)'Access;
      if Name = "create_date" then
         return Util.Beans.Objects.Time.To_Object (Impl.Create_Date);
      elsif Name = "message" then
         return Util.Beans.Objects.To_Object (Impl.Message);
      elsif Name = "entity_id" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (Impl.Entity_Id));
      elsif Name = "id" then
         return ADO.Objects.To_Object (Impl.Get_Key);
      elsif Name = "entity_type" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (Impl.Entity_Type));
      elsif Name = "status" then
         return AWA.Comments.Models.Status_Type_Objects.To_Object (Impl.Status);
      elsif Name = "format" then
         return AWA.Comments.Models.Format_Type_Objects.To_Object (Impl.Format);
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;



   --  ------------------------------
   --  Load the object from current iterator position
   --  ------------------------------
   procedure Load (Object  : in out Comment_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class) is
   begin
      Object.Create_Date := Stmt.Get_Time (0);
      Object.Message := Stmt.Get_Unbounded_String (1);
      Object.Entity_Id := Stmt.Get_Identifier (2);
      Object.Set_Key_Value (Stmt.Get_Identifier (3));
      Object.Entity_Type := ADO.Entity_Type (Stmt.Get_Integer (5));
      Object.Status := Status_Type'Val (Stmt.Get_Integer (6));
      Object.Format := Format_Type'Val (Stmt.Get_Integer (7));
      if not Stmt.Is_Null (8) then
         Object.Author.Set_Key_Value (Stmt.Get_Identifier (8), Session);
      end if;
      Object.Version := Stmt.Get_Integer (4);
      ADO.Objects.Set_Created (Object);
   end Load;


   --  ------------------------------
   --  Get the bean attribute identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in Comment_Info;
                       Name : in String) return Util.Beans.Objects.Object is
   begin
      if Name = "id" then
         return Util.Beans.Objects.To_Object (Long_Long_Integer (From.Id));
      elsif Name = "author" then
         return Util.Beans.Objects.To_Object (From.Author);
      elsif Name = "email" then
         return Util.Beans.Objects.To_Object (From.Email);
      elsif Name = "date" then
         return Util.Beans.Objects.Time.To_Object (From.Date);
      elsif Name = "format" then
         return AWA.Comments.Models.Format_Type_Objects.To_Object (From.Format);
      elsif Name = "comment" then
         return Util.Beans.Objects.To_Object (From.Comment);
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;


   --  ------------------------------
   --  Set the value identified by the name
   --  ------------------------------
   overriding
   procedure Set_Value (Item  : in out Comment_Info;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object) is
   begin
      if Name = "id" then
         Item.Id := ADO.Identifier (Util.Beans.Objects.To_Long_Long_Integer (Value));
      elsif Name = "author" then
         Item.Author := Util.Beans.Objects.To_Unbounded_String (Value);
      elsif Name = "email" then
         Item.Email := Util.Beans.Objects.To_Unbounded_String (Value);
      elsif Name = "date" then
         Item.Date := Util.Beans.Objects.Time.To_Time (Value);
      elsif Name = "format" then
         Item.Format := AWA.Comments.Models.Format_Type_Objects.To_Value (Value);
      elsif Name = "comment" then
         Item.Comment := Util.Beans.Objects.To_Unbounded_String (Value);
      end if;
   end Set_Value;


   --  --------------------
   --  Run the query controlled by <b>Context</b> and append the list in <b>Object</b>.
   --  --------------------
   procedure List (Object  : in out Comment_Info_List_Bean'Class;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class) is
   begin
      List (Object.List, Session, Context);
   end List;

   --  --------------------
   --  The comment information.
   --  --------------------
   procedure List (Object  : in out Comment_Info_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class) is
      procedure Read (Into : in out Comment_Info);

      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Context);
      Pos  : Natural := 0;
      procedure Read (Into : in out Comment_Info) is
      begin
         Into.Id := Stmt.Get_Identifier (0);
         Into.Author := Stmt.Get_Unbounded_String (1);
         Into.Email := Stmt.Get_Unbounded_String (2);
         Into.Date := Stmt.Get_Time (3);
         Into.Format := AWA.Comments.Models.Format_Type'Val (Stmt.Get_Integer (4));
         Into.Comment := Stmt.Get_Unbounded_String (5);
      end Read;
   begin
      Stmt.Execute;
      Comment_Info_Vectors.Clear (Object);
      while Stmt.Has_Elements loop
         Object.Insert_Space (Before => Pos);
         Object.Update_Element (Index => Pos, Process => Read'Access);
         Pos := Pos + 1;
         Stmt.Next;
      end loop;
   end List;


   procedure Op_Create (Bean    : in out Comment_Bean;
                        Outcome : in out Ada.Strings.Unbounded.Unbounded_String);
   procedure Op_Create (Bean    : in out Comment_Bean;
                        Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      Comment_Bean'Class (Bean).Create (Outcome);
   end Op_Create;
   package Binding_Comment_Bean_1 is
     new ASF.Events.Faces.Actions.Action_Method.Bind (Bean   => Comment_Bean,
                                                      Method => Op_Create,
                                                      Name   => "create");
   procedure Op_Delete (Bean    : in out Comment_Bean;
                        Outcome : in out Ada.Strings.Unbounded.Unbounded_String);
   procedure Op_Delete (Bean    : in out Comment_Bean;
                        Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      Comment_Bean'Class (Bean).Delete (Outcome);
   end Op_Delete;
   package Binding_Comment_Bean_2 is
     new ASF.Events.Faces.Actions.Action_Method.Bind (Bean   => Comment_Bean,
                                                      Method => Op_Delete,
                                                      Name   => "delete");
   procedure Op_Save (Bean    : in out Comment_Bean;
                      Outcome : in out Ada.Strings.Unbounded.Unbounded_String);
   procedure Op_Save (Bean    : in out Comment_Bean;
                      Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      Comment_Bean'Class (Bean).Save (Outcome);
   end Op_Save;
   package Binding_Comment_Bean_3 is
     new ASF.Events.Faces.Actions.Action_Method.Bind (Bean   => Comment_Bean,
                                                      Method => Op_Save,
                                                      Name   => "save");
   procedure Op_Publish (Bean    : in out Comment_Bean;
                         Outcome : in out Ada.Strings.Unbounded.Unbounded_String);
   procedure Op_Publish (Bean    : in out Comment_Bean;
                         Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      Comment_Bean'Class (Bean).Publish (Outcome);
   end Op_Publish;
   package Binding_Comment_Bean_4 is
     new ASF.Events.Faces.Actions.Action_Method.Bind (Bean   => Comment_Bean,
                                                      Method => Op_Publish,
                                                      Name   => "publish");

   Binding_Comment_Bean_Array : aliased constant Util.Beans.Methods.Method_Binding_Array
     := (1 => Binding_Comment_Bean_1.Proxy'Access,
         2 => Binding_Comment_Bean_2.Proxy'Access,
         3 => Binding_Comment_Bean_3.Proxy'Access,
         4 => Binding_Comment_Bean_4.Proxy'Access
     );

   --  ------------------------------
   --  This bean provides some methods that can be used in a Method_Expression.
   --  ------------------------------
   overriding
   function Get_Method_Bindings (From : in Comment_Bean)
                                 return Util.Beans.Methods.Method_Binding_Array_Access is
      pragma Unreferenced (From);
   begin
      return Binding_Comment_Bean_Array'Access;
   end Get_Method_Bindings;

   --  ------------------------------
   --  Set the value identified by the name
   --  ------------------------------
   overriding
   procedure Set_Value (Item  : in out Comment_Bean;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object) is
   begin
      if Name = "create_date" then
         Item.Set_Create_Date (Util.Beans.Objects.Time.To_Time (Value));
      elsif Name = "message" then
         Item.Set_Message (Util.Beans.Objects.To_String (Value));
      elsif Name = "entity_id" then
         Item.Set_Entity_Id (ADO.Identifier (Util.Beans.Objects.To_Long_Long_Integer (Value)));
      elsif Name = "entity_type" then
         Item.Set_Entity_Type (ADO.Entity_Type (Util.Beans.Objects.To_Integer (Value)));
      elsif Name = "status" then
         Item.Set_Status (Status_Type_Objects.To_Value (Value));
      elsif Name = "format" then
         Item.Set_Format (Format_Type_Objects.To_Value (Value));
      end if;
   end Set_Value;


end AWA.Comments.Models;
