-----------------------------------------------------------------------
--  AWA.Tags.Models -- AWA.Tags.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-spec.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2013 Stephane Carrez
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
pragma Warnings (Off, "unit * is not referenced");
with ADO.Sessions;
with ADO.Objects;
with ADO.Statements;
with ADO.SQL;
with ADO.Schemas;
with ADO.Queries;
with ADO.Queries.Loaders;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Util.Beans.Objects;
with Util.Beans.Basic.Lists;
pragma Warnings (On, "unit * is not referenced");
package AWA.Tags.Models is
   type Tag_Ref is new ADO.Objects.Object_Ref with null record;

   type Tagged_Entity_Ref is new ADO.Objects.Object_Ref with null record;

   --  --------------------
   --  The tag definition.
   --  --------------------
   --  Create an object key for Tag.
   function Tag_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Tag from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Tag_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Tag : constant Tag_Ref;
   function "=" (Left, Right : Tag_Ref'Class) return Boolean;

   --  Set the tag identifier
   procedure Set_Id (Object : in out Tag_Ref;
                     Value  : in ADO.Identifier);

   --  Get the tag identifier
   function Get_Id (Object : in Tag_Ref)
                 return ADO.Identifier;

   --  Set the tag name
   procedure Set_Name (Object : in out Tag_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Name (Object : in out Tag_Ref;
                       Value : in String);

   --  Get the tag name
   function Get_Name (Object : in Tag_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Name (Object : in Tag_Ref)
                 return String;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Tag_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Tag_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Tag_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Tag_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Tag_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Tag_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   TAG_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Tag_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Tag_Ref;
                   Into   : in out Tag_Ref);

   package Tag_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Tag_Ref,
                                  "="          => "=");
   subtype Tag_Vector is Tag_Vectors.Vector;

   procedure List (Object  : in out Tag_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);
   --  Create an object key for Tagged_Entity.
   function Tagged_Entity_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Tagged_Entity from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Tagged_Entity_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Tagged_Entity : constant Tagged_Entity_Ref;
   function "=" (Left, Right : Tagged_Entity_Ref'Class) return Boolean;

   --  Set the tag entity identifier
   procedure Set_Id (Object : in out Tagged_Entity_Ref;
                     Value  : in ADO.Identifier);

   --  Get the tag entity identifier
   function Get_Id (Object : in Tagged_Entity_Ref)
                 return ADO.Identifier;

   --  Set Title: Tag model
   --  Date: 2013-02-23the database entity to which the tag is associated
   procedure Set_For_Entity_Id (Object : in out Tagged_Entity_Ref;
                                Value  : in ADO.Identifier);

   --  Get Title: Tag model
   --  Date: 2013-02-23the database entity to which the tag is associated
   function Get_For_Entity_Id (Object : in Tagged_Entity_Ref)
                 return ADO.Identifier;

   --  Set the entity type
   procedure Set_Entity_Type (Object : in out Tagged_Entity_Ref;
                              Value  : in ADO.Entity_Type);

   --  Get the entity type
   function Get_Entity_Type (Object : in Tagged_Entity_Ref)
                 return ADO.Entity_Type;

   --
   procedure Set_Tag (Object : in out Tagged_Entity_Ref;
                      Value  : in AWA.Tags.Models.Tag_Ref'Class);

   --
   function Get_Tag (Object : in Tagged_Entity_Ref)
                 return AWA.Tags.Models.Tag_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Tagged_Entity_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Tagged_Entity_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Tagged_Entity_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Tagged_Entity_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Tagged_Entity_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Tagged_Entity_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   TAGGED_ENTITY_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Tagged_Entity_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Tagged_Entity_Ref;
                   Into   : in out Tagged_Entity_Ref);

   package Tagged_Entity_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Tagged_Entity_Ref,
                                  "="          => "=");
   subtype Tagged_Entity_Vector is Tagged_Entity_Vectors.Vector;

   procedure List (Object  : in out Tagged_Entity_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);

   --  --------------------
   --  The tag information.
   --  --------------------
   type Tag_Info is new Util.Beans.Basic.Readonly_Bean with record
      --  the tag name.
      Tag : Ada.Strings.Unbounded.Unbounded_String;

      --  the number of references for the tag.
      Count : Natural;

   end record;

   --  Get the bean attribute identified by the given name.
   overriding
   function Get_Value (From : in Tag_Info;
                       Name : in String) return Util.Beans.Objects.Object;

   package Tag_Info_Beans is
      new Util.Beans.Basic.Lists (Element_Type => Tag_Info);
   package Tag_Info_Vectors renames Tag_Info_Beans.Vectors;
   subtype Tag_Info_List_Bean is Tag_Info_Beans.List_Bean;

   type Tag_Info_List_Bean_Access is access all Tag_Info_List_Bean;

   --  Run the query controlled by <b>Context</b> and append the list in <b>Object</b>.
   procedure List (Object  : in out Tag_Info_List_Bean'Class;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class);

   subtype Tag_Info_Vector is Tag_Info_Vectors.Vector;

   --  Run the query controlled by <b>Context</b> and append the list in <b>Object</b>.
   procedure List (Object  : in out Tag_Info_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Context : in out ADO.Queries.Context'Class);

   Query_Check_Tag : constant ADO.Queries.Query_Definition_Access;

   Query_Tag_List : constant ADO.Queries.Query_Definition_Access;

   Query_Tag_Search : constant ADO.Queries.Query_Definition_Access;

   Query_Tag_List_All : constant ADO.Queries.Query_Definition_Access;

   Query_Tag_List_For_Entities : constant ADO.Queries.Query_Definition_Access;



private
   TAG_NAME : aliased constant String := "awa_tag";
   COL_0_1_NAME : aliased constant String := "id";
   COL_1_1_NAME : aliased constant String := "name";

   TAG_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 2,
      Table => TAG_NAME'Access,
      Members => (
         1 => COL_0_1_NAME'Access,
         2 => COL_1_1_NAME'Access
)
     );
   TAG_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := TAG_DEF'Access;

   Null_Tag : constant Tag_Ref
      := Tag_Ref'(ADO.Objects.Object_Ref with others => <>);

   type Tag_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => TAG_DEF'Access)
   with record
       Name : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   type Tag_Access is access all Tag_Impl;

   overriding
   procedure Destroy (Object : access Tag_Impl);

   overriding
   procedure Find (Object  : in out Tag_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Tag_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Tag_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Tag_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Tag_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Tag_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Tag_Ref'Class;
                        Impl   : out Tag_Access);
   TAGGED_ENTITY_NAME : aliased constant String := "awa_tagged_entity";
   COL_0_2_NAME : aliased constant String := "id";
   COL_1_2_NAME : aliased constant String := "for_entity_id";
   COL_2_2_NAME : aliased constant String := "entity_type";
   COL_3_2_NAME : aliased constant String := "tag_id";

   TAGGED_ENTITY_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 4,
      Table => TAGGED_ENTITY_NAME'Access,
      Members => (
         1 => COL_0_2_NAME'Access,
         2 => COL_1_2_NAME'Access,
         3 => COL_2_2_NAME'Access,
         4 => COL_3_2_NAME'Access
)
     );
   TAGGED_ENTITY_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := TAGGED_ENTITY_DEF'Access;

   Null_Tagged_Entity : constant Tagged_Entity_Ref
      := Tagged_Entity_Ref'(ADO.Objects.Object_Ref with others => <>);

   type Tagged_Entity_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => TAGGED_ENTITY_DEF'Access)
   with record
       For_Entity_Id : ADO.Identifier;
       Entity_Type : ADO.Entity_Type;
       Tag : AWA.Tags.Models.Tag_Ref;
   end record;

   type Tagged_Entity_Access is access all Tagged_Entity_Impl;

   overriding
   procedure Destroy (Object : access Tagged_Entity_Impl);

   overriding
   procedure Find (Object  : in out Tagged_Entity_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Tagged_Entity_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Tagged_Entity_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Tagged_Entity_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Tagged_Entity_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Tagged_Entity_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Tagged_Entity_Ref'Class;
                        Impl   : out Tagged_Entity_Access);

   package File_1 is
      new ADO.Queries.Loaders.File (Path => "tag-queries.xml",
                                    Sha1 => "BFA439EF20901C425F86DB33AD8870BADB46FBEB");

   package Def_Taginfo_Check_Tag is
      new ADO.Queries.Loaders.Query (Name => "check-tag",
                                     File => File_1.File'Access);
   Query_Check_Tag : constant ADO.Queries.Query_Definition_Access
   := Def_Taginfo_Check_Tag.Query'Access;

   package Def_Taginfo_Tag_List is
      new ADO.Queries.Loaders.Query (Name => "tag-list",
                                     File => File_1.File'Access);
   Query_Tag_List : constant ADO.Queries.Query_Definition_Access
   := Def_Taginfo_Tag_List.Query'Access;

   package Def_Taginfo_Tag_Search is
      new ADO.Queries.Loaders.Query (Name => "tag-search",
                                     File => File_1.File'Access);
   Query_Tag_Search : constant ADO.Queries.Query_Definition_Access
   := Def_Taginfo_Tag_Search.Query'Access;

   package Def_Taginfo_Tag_List_All is
      new ADO.Queries.Loaders.Query (Name => "tag-list-all",
                                     File => File_1.File'Access);
   Query_Tag_List_All : constant ADO.Queries.Query_Definition_Access
   := Def_Taginfo_Tag_List_All.Query'Access;

   package Def_Taginfo_Tag_List_For_Entities is
      new ADO.Queries.Loaders.Query (Name => "tag-list-for-entities",
                                     File => File_1.File'Access);
   Query_Tag_List_For_Entities : constant ADO.Queries.Query_Definition_Access
   := Def_Taginfo_Tag_List_For_Entities.Query'Access;
end AWA.Tags.Models;
