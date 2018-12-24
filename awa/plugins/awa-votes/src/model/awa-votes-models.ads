-----------------------------------------------------------------------
--  AWA.Votes.Models -- AWA.Votes.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-spec.xhtml
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
pragma Warnings (Off);
with ADO.Sessions;
with ADO.Objects;
with ADO.Statements;
with ADO.SQL;
with ADO.Schemas;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded;
with Util.Beans.Objects;
with Util.Beans.Basic.Lists;
with Util.Beans.Methods;
pragma Warnings (On);
package AWA.Votes.Models is

   pragma Style_Checks ("-mr");

   type Rating_Ref is new ADO.Objects.Object_Ref with null record;

   type Vote_Ref is new ADO.Objects.Object_Ref with null record;

   --  Create an object key for Rating.
   function Rating_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Rating from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Rating_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Rating : constant Rating_Ref;
   function "=" (Left, Right : Rating_Ref'Class) return Boolean;

   --  Set the rating identifier
   procedure Set_Id (Object : in out Rating_Ref;
                     Value  : in ADO.Identifier);

   --  Get the rating identifier
   function Get_Id (Object : in Rating_Ref)
                 return ADO.Identifier;

   --  Set the rating taking into account all votes
   procedure Set_Rating (Object : in out Rating_Ref;
                         Value  : in Integer);

   --  Get the rating taking into account all votes
   function Get_Rating (Object : in Rating_Ref)
                 return Integer;

   --  Set the number of votes
   procedure Set_Vote_Count (Object : in out Rating_Ref;
                             Value  : in Integer);

   --  Get the number of votes
   function Get_Vote_Count (Object : in Rating_Ref)
                 return Integer;

   --
   procedure Set_For_Entity_Id (Object : in out Rating_Ref;
                                Value  : in ADO.Identifier);

   --
   function Get_For_Entity_Id (Object : in Rating_Ref)
                 return ADO.Identifier;

   --  Set the entity type
   procedure Set_For_Entity_Type (Object : in out Rating_Ref;
                                  Value  : in ADO.Entity_Type);

   --  Get the entity type
   function Get_For_Entity_Type (Object : in Rating_Ref)
                 return ADO.Entity_Type;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Rating_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Rating_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Rating_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Rating_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Rating_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Rating_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   RATING_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Rating_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Rating_Ref;
                   Into   : in out Rating_Ref);

   --  --------------------
   --  The vote table tracks a vote action by a user on a given database entity.
   --  The primary key is made of the user, the entity id and entity type.
   --  --------------------
   --  Create an object key for Vote.
   function Vote_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Vote from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Vote_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Vote : constant Vote_Ref;
   function "=" (Left, Right : Vote_Ref'Class) return Boolean;

   --
   procedure Set_Rating (Object : in out Vote_Ref;
                         Value  : in Integer);

   --
   function Get_Rating (Object : in Vote_Ref)
                 return Integer;

   --
   procedure Set_Entity (Object : in out Vote_Ref;
                         Value  : in AWA.Votes.Models.Rating_Ref'Class);

   --
   function Get_Entity (Object : in Vote_Ref)
                 return AWA.Votes.Models.Rating_Ref'Class;

   --
   procedure Set_User_Id (Object : in out Vote_Ref;
                          Value  : in ADO.Identifier);

   --
   function Get_User_Id (Object : in Vote_Ref)
                 return ADO.Identifier;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Vote_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Vote_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Vote_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Vote_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Vote_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Vote_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   VOTE_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Vote_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Vote_Ref;
                   Into   : in out Vote_Ref);



   type Vote_Bean is abstract
     new Util.Beans.Basic.Bean and Util.Beans.Methods.Method_Bean with  record

      --  the permission name to check if the user is allowed to vote
      Permission : Ada.Strings.Unbounded.Unbounded_String;

      --  the entity identifier
      Entity_Id : ADO.Identifier;

      --  the user rating
      Rating : Integer;

      --  the entity type
      Entity_Type : Ada.Strings.Unbounded.Unbounded_String;

      --  the total rating for the entity
      Total : Integer;
   end record;

   --  This bean provides some methods that can be used in a Method_Expression.
   overriding
   function Get_Method_Bindings (From : in Vote_Bean)
                                 return Util.Beans.Methods.Method_Binding_Array_Access;

   --  Get the bean attribute identified by the name.
   overriding
   function Get_Value (From : in Vote_Bean;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Set the bean attribute identified by the name.
   overriding
   procedure Set_Value (Item  : in out Vote_Bean;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object);

   procedure Vote_Up (Bean : in out Vote_Bean;
                     Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is abstract;

   procedure Vote_Down (Bean : in out Vote_Bean;
                       Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is abstract;

   procedure Vote (Bean : in out Vote_Bean;
                  Outcome : in out Ada.Strings.Unbounded.Unbounded_String) is abstract;


private
   RATING_NAME : aliased constant String := "awa_rating";
   COL_0_1_NAME : aliased constant String := "id";
   COL_1_1_NAME : aliased constant String := "rating";
   COL_2_1_NAME : aliased constant String := "vote_count";
   COL_3_1_NAME : aliased constant String := "for_entity_id";
   COL_4_1_NAME : aliased constant String := "for_entity_type";

   RATING_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count   => 5,
      Table   => RATING_NAME'Access,
      Members => (
         1 => COL_0_1_NAME'Access,
         2 => COL_1_1_NAME'Access,
         3 => COL_2_1_NAME'Access,
         4 => COL_3_1_NAME'Access,
         5 => COL_4_1_NAME'Access)
     );
   RATING_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := RATING_DEF'Access;


   Null_Rating : constant Rating_Ref
      := Rating_Ref'(ADO.Objects.Object_Ref with null record);

   type Rating_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => RATING_DEF'Access)
   with record
       Rating : Integer;
       Vote_Count : Integer;
       For_Entity_Id : ADO.Identifier;
       For_Entity_Type : ADO.Entity_Type;
   end record;

   type Rating_Access is access all Rating_Impl;

   overriding
   procedure Destroy (Object : access Rating_Impl);

   overriding
   procedure Find (Object  : in out Rating_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Rating_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Rating_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Rating_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Rating_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Rating_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Rating_Ref'Class;
                        Impl   : out Rating_Access);
   VOTE_NAME : aliased constant String := "awa_vote";
   COL_0_2_NAME : aliased constant String := "rating";
   COL_1_2_NAME : aliased constant String := "entity_id";
   COL_2_2_NAME : aliased constant String := "user_id";

   VOTE_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count   => 3,
      Table   => VOTE_NAME'Access,
      Members => (
         1 => COL_0_2_NAME'Access,
         2 => COL_1_2_NAME'Access,
         3 => COL_2_2_NAME'Access)
     );
   VOTE_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := VOTE_DEF'Access;


   Null_Vote : constant Vote_Ref
      := Vote_Ref'(ADO.Objects.Object_Ref with null record);

   type Vote_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => VOTE_DEF'Access)
   with record
       Rating : Integer;
       Entity : AWA.Votes.Models.Rating_Ref;
   end record;

   type Vote_Access is access all Vote_Impl;

   overriding
   procedure Destroy (Object : access Vote_Impl);

   overriding
   procedure Find (Object  : in out Vote_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Vote_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Vote_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Vote_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Vote_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Vote_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Vote_Ref'Class;
                        Impl   : out Vote_Access);
end AWA.Votes.Models;
