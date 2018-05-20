-----------------------------------------------------------------------
--  AWA.Settings.Models -- AWA.Settings.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-spec.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2017 Stephane Carrez
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
with AWA.Users.Models;
pragma Warnings (On);
package AWA.Settings.Models is

   pragma Style_Checks ("-mr");

   type Setting_Ref is new ADO.Objects.Object_Ref with null record;

   type Global_Setting_Ref is new ADO.Objects.Object_Ref with null record;

   type User_Setting_Ref is new ADO.Objects.Object_Ref with null record;

   --  --------------------
   --  The setting table defines all the possible settings
   --  that an application manages.  This table is automatically
   --  populated when an application starts. It is not modified.
   --  --------------------
   --  Create an object key for Setting.
   function Setting_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Setting from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Setting_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Setting : constant Setting_Ref;
   function "=" (Left, Right : Setting_Ref'Class) return Boolean;

   --  Set the setting identifier.
   procedure Set_Id (Object : in out Setting_Ref;
                     Value  : in ADO.Identifier);

   --  Get the setting identifier.
   function Get_Id (Object : in Setting_Ref)
                 return ADO.Identifier;

   --  Set the setting name.
   procedure Set_Name (Object : in out Setting_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Name (Object : in out Setting_Ref;
                       Value : in String);

   --  Get the setting name.
   function Get_Name (Object : in Setting_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Name (Object : in Setting_Ref)
                 return String;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Setting_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Setting_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Setting_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Setting_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Setting_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Setting_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   SETTING_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Setting_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Setting_Ref;
                   Into   : in out Setting_Ref);

   package Setting_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Setting_Ref,
                                  "="          => "=");
   subtype Setting_Vector is Setting_Vectors.Vector;

   procedure List (Object  : in out Setting_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);
   --  --------------------
   --  The global setting holds some generic
   --  application configuration parameter
   --  which can be stored in the database.
   --  The global setting can be specific to a server.
   --  --------------------
   --  Create an object key for Global_Setting.
   function Global_Setting_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for Global_Setting from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function Global_Setting_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_Global_Setting : constant Global_Setting_Ref;
   function "=" (Left, Right : Global_Setting_Ref'Class) return Boolean;

   --  Set the global setting identifier.
   procedure Set_Id (Object : in out Global_Setting_Ref;
                     Value  : in ADO.Identifier);

   --  Get the global setting identifier.
   function Get_Id (Object : in Global_Setting_Ref)
                 return ADO.Identifier;

   --  Set the global setting value.
   procedure Set_Value (Object : in out Global_Setting_Ref;
                        Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Value (Object : in out Global_Setting_Ref;
                        Value : in String);

   --  Get the global setting value.
   function Get_Value (Object : in Global_Setting_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Value (Object : in Global_Setting_Ref)
                 return String;
   --  Get the global setting optimistic lock version.
   function Get_Version (Object : in Global_Setting_Ref)
                 return Integer;

   --  Set the server to which this global setting applies.
   procedure Set_Server_Id (Object : in out Global_Setting_Ref;
                            Value  : in Integer);

   --  Get the server to which this global setting applies.
   function Get_Server_Id (Object : in Global_Setting_Ref)
                 return Integer;

   --  Set the setting that corresponds to this global setting.
   procedure Set_Setting (Object : in out Global_Setting_Ref;
                          Value  : in AWA.Settings.Models.Setting_Ref'Class);

   --  Get the setting that corresponds to this global setting.
   function Get_Setting (Object : in Global_Setting_Ref)
                 return AWA.Settings.Models.Setting_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out Global_Setting_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out Global_Setting_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out Global_Setting_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out Global_Setting_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out Global_Setting_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in Global_Setting_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   GLOBAL_SETTING_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out Global_Setting_Ref);

   --  Copy of the object.
   procedure Copy (Object : in Global_Setting_Ref;
                   Into   : in out Global_Setting_Ref);

   package Global_Setting_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Natural,
                                  Element_Type => Global_Setting_Ref,
                                  "="          => "=");
   subtype Global_Setting_Vector is Global_Setting_Vectors.Vector;

   procedure List (Object  : in out Global_Setting_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class);
   --  --------------------
   --  The user setting holds the setting value for a given user.
   --  It is created the first time a user changes the default
   --  setting value. It is updated when the user modifies the setting.
   --  --------------------
   --  Create an object key for User_Setting.
   function User_Setting_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key;
   --  Create an object key for User_Setting from a string.
   --  Raises Constraint_Error if the string cannot be converted into the object key.
   function User_Setting_Key (Id : in String) return ADO.Objects.Object_Key;

   Null_User_Setting : constant User_Setting_Ref;
   function "=" (Left, Right : User_Setting_Ref'Class) return Boolean;

   --  Set the user setting identifier.
   procedure Set_Id (Object : in out User_Setting_Ref;
                     Value  : in ADO.Identifier);

   --  Get the user setting identifier.
   function Get_Id (Object : in User_Setting_Ref)
                 return ADO.Identifier;

   --  Set the setting value.
   procedure Set_Value (Object : in out User_Setting_Ref;
                        Value  : in Ada.Strings.Unbounded.Unbounded_String);
   procedure Set_Value (Object : in out User_Setting_Ref;
                        Value : in String);

   --  Get the setting value.
   function Get_Value (Object : in User_Setting_Ref)
                 return Ada.Strings.Unbounded.Unbounded_String;
   function Get_Value (Object : in User_Setting_Ref)
                 return String;
   --  Get the setting optimistic lock version.
   function Get_Version (Object : in User_Setting_Ref)
                 return Integer;

   --  Set the setting that correspond to the value.
   procedure Set_Setting (Object : in out User_Setting_Ref;
                          Value  : in AWA.Settings.Models.Setting_Ref'Class);

   --  Get the setting that correspond to the value.
   function Get_Setting (Object : in User_Setting_Ref)
                 return AWA.Settings.Models.Setting_Ref'Class;

   --  Set the user to which the setting value is associated.
   procedure Set_User (Object : in out User_Setting_Ref;
                       Value  : in AWA.Users.Models.User_Ref'Class);

   --  Get the user to which the setting value is associated.
   function Get_User (Object : in User_Setting_Ref)
                 return AWA.Users.Models.User_Ref'Class;

   --  Load the entity identified by 'Id'.
   --  Raises the NOT_FOUND exception if it does not exist.
   procedure Load (Object  : in out User_Setting_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier);

   --  Load the entity identified by 'Id'.
   --  Returns True in <b>Found</b> if the object was found and False if it does not exist.
   procedure Load (Object  : in out User_Setting_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean);

   --  Find and load the entity.
   overriding
   procedure Find (Object  : in out User_Setting_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   --  Save the entity.  If the entity does not have an identifier, an identifier is allocated
   --  and it is inserted in the table.  Otherwise, only data fields which have been changed
   --  are updated.
   overriding
   procedure Save (Object  : in out User_Setting_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class);

   --  Delete the entity.
   overriding
   procedure Delete (Object  : in out User_Setting_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   function Get_Value (From : in User_Setting_Ref;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Table definition
   USER_SETTING_TABLE : constant ADO.Schemas.Class_Mapping_Access;

   --  Internal method to allocate the Object_Record instance
   overriding
   procedure Allocate (Object : in out User_Setting_Ref);

   --  Copy of the object.
   procedure Copy (Object : in User_Setting_Ref;
                   Into   : in out User_Setting_Ref);




private
   SETTING_NAME : aliased constant String := "awa_setting";
   COL_0_1_NAME : aliased constant String := "id";
   COL_1_1_NAME : aliased constant String := "name";

   SETTING_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 2,
      Table => SETTING_NAME'Access,
      Members => (
         1 => COL_0_1_NAME'Access,
         2 => COL_1_1_NAME'Access
)
     );
   SETTING_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := SETTING_DEF'Access;

   Null_Setting : constant Setting_Ref
      := Setting_Ref'(ADO.Objects.Object_Ref with null record);

   type Setting_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => SETTING_DEF'Access)
   with record
       Name : Ada.Strings.Unbounded.Unbounded_String;
   end record;

   type Setting_Access is access all Setting_Impl;

   overriding
   procedure Destroy (Object : access Setting_Impl);

   overriding
   procedure Find (Object  : in out Setting_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Setting_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Setting_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Setting_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Setting_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Setting_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Setting_Ref'Class;
                        Impl   : out Setting_Access);
   GLOBAL_SETTING_NAME : aliased constant String := "awa_global_setting";
   COL_0_2_NAME : aliased constant String := "id";
   COL_1_2_NAME : aliased constant String := "value";
   COL_2_2_NAME : aliased constant String := "version";
   COL_3_2_NAME : aliased constant String := "server_id";
   COL_4_2_NAME : aliased constant String := "setting_id";

   GLOBAL_SETTING_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 5,
      Table => GLOBAL_SETTING_NAME'Access,
      Members => (
         1 => COL_0_2_NAME'Access,
         2 => COL_1_2_NAME'Access,
         3 => COL_2_2_NAME'Access,
         4 => COL_3_2_NAME'Access,
         5 => COL_4_2_NAME'Access
)
     );
   GLOBAL_SETTING_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := GLOBAL_SETTING_DEF'Access;

   Null_Global_Setting : constant Global_Setting_Ref
      := Global_Setting_Ref'(ADO.Objects.Object_Ref with null record);

   type Global_Setting_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => GLOBAL_SETTING_DEF'Access)
   with record
       Value : Ada.Strings.Unbounded.Unbounded_String;
       Version : Integer;
       Server_Id : Integer;
       Setting : AWA.Settings.Models.Setting_Ref;
   end record;

   type Global_Setting_Access is access all Global_Setting_Impl;

   overriding
   procedure Destroy (Object : access Global_Setting_Impl);

   overriding
   procedure Find (Object  : in out Global_Setting_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out Global_Setting_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out Global_Setting_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out Global_Setting_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out Global_Setting_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out Global_Setting_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out Global_Setting_Ref'Class;
                        Impl   : out Global_Setting_Access);
   USER_SETTING_NAME : aliased constant String := "awa_user_setting";
   COL_0_3_NAME : aliased constant String := "id";
   COL_1_3_NAME : aliased constant String := "value";
   COL_2_3_NAME : aliased constant String := "version";
   COL_3_3_NAME : aliased constant String := "setting_id";
   COL_4_3_NAME : aliased constant String := "user_id";

   USER_SETTING_DEF : aliased constant ADO.Schemas.Class_Mapping :=
     (Count => 5,
      Table => USER_SETTING_NAME'Access,
      Members => (
         1 => COL_0_3_NAME'Access,
         2 => COL_1_3_NAME'Access,
         3 => COL_2_3_NAME'Access,
         4 => COL_3_3_NAME'Access,
         5 => COL_4_3_NAME'Access
)
     );
   USER_SETTING_TABLE : constant ADO.Schemas.Class_Mapping_Access
      := USER_SETTING_DEF'Access;

   Null_User_Setting : constant User_Setting_Ref
      := User_Setting_Ref'(ADO.Objects.Object_Ref with null record);

   type User_Setting_Impl is
      new ADO.Objects.Object_Record (Key_Type => ADO.Objects.KEY_INTEGER,
                                     Of_Class => USER_SETTING_DEF'Access)
   with record
       Value : Ada.Strings.Unbounded.Unbounded_String;
       Version : Integer;
       Setting : AWA.Settings.Models.Setting_Ref;
       User : AWA.Users.Models.User_Ref;
   end record;

   type User_Setting_Access is access all User_Setting_Impl;

   overriding
   procedure Destroy (Object : access User_Setting_Impl);

   overriding
   procedure Find (Object  : in out User_Setting_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean);

   overriding
   procedure Load (Object  : in out User_Setting_Impl;
                   Session : in out ADO.Sessions.Session'Class);
   procedure Load (Object  : in out User_Setting_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class);

   overriding
   procedure Save (Object  : in out User_Setting_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class);

   procedure Create (Object  : in out User_Setting_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   overriding
   procedure Delete (Object  : in out User_Setting_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class);

   procedure Set_Field (Object : in out User_Setting_Ref'Class;
                        Impl   : out User_Setting_Access);
end AWA.Settings.Models;
