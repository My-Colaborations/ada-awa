-----------------------------------------------------------------------
--  awa-users-beans -- ASF Beans for user module
--  Copyright (C) 2011, 2012, 2013 Stephane Carrez
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

with Util.Beans.Basic;
with Util.Beans.Objects;
with Util.Beans.Methods;
with Ada.Strings.Unbounded;

with AWA.Users.Services;
with AWA.Users.Modules;
with AWA.Users.Principals;

package AWA.Users.Beans is

   use Ada.Strings.Unbounded;

   type Authenticate_Bean is new Util.Beans.Basic.Bean
     and Util.Beans.Methods.Method_Bean with record
      Module     : AWA.Users.Modules.User_Module_Access := null;
      Manager    : AWA.Users.Services.User_Service_Access := null;
      Email      : Unbounded_String;
      Password   : Unbounded_String;
      First_Name : Unbounded_String;
      Last_Name  : Unbounded_String;
      Access_Key : Unbounded_String;
   end record;

   --  Attributes exposed by the <b>Authenticate_Bean</b> through Get_Value.
   EMAIL_ATTR      : constant String := "email";
   PASSWORD_ATTR   : constant String := "password";
   FIRST_NAME_ATTR : constant String := "firstName";
   LAST_NAME_ATTR  : constant String := "lastName";
   KEY_ATTR        : constant String := "key";

   type Authenticate_Bean_Access is access all Authenticate_Bean'Class;

   --  Get the value identified by the name.
   overriding
   function Get_Value (From : in Authenticate_Bean;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Set the value identified by the name.
   overriding
   procedure Set_Value (From  : in out Authenticate_Bean;
                        Name  : in String;
                        Value : in Util.Beans.Objects.Object);

   --  This bean provides some methods that can be used in a Method_Expression
   overriding
   function Get_Method_Bindings (From : in Authenticate_Bean)
                                 return Util.Beans.Methods.Method_Binding_Array_Access;

   procedure Set_Session_Principal (Data      : in Authenticate_Bean;
                                    Principal : in AWA.Users.Principals.Principal_Access);

   procedure Set_Authenticate_Cookie (Data      : in out Authenticate_Bean;
                                      Principal : in AWA.Users.Principals.Principal_Access);

   --  Action to register a user
   procedure Register_User (Data    : in out Authenticate_Bean;
                            Outcome : in out Unbounded_String);

   --  Action to verify the user after the registration
   procedure Verify_User (Data    : in out Authenticate_Bean;
                          Outcome : in out Unbounded_String);

   --  Action to trigger the lost password email process.
   procedure Lost_Password (Data    : in out Authenticate_Bean;
                            Outcome : in out Unbounded_String);

   --  Action to validate the reset password key and set a new password.
   procedure Reset_Password (Data    : in out Authenticate_Bean;
                             Outcome : in out Unbounded_String);

   --  Action to authenticate a user (password authentication).
   procedure Authenticate_User (Data    : in out Authenticate_Bean;
                                Outcome : in out Unbounded_String);

   --  Logout the user and closes the session.
   procedure Logout_User (Data    : in out Authenticate_Bean;
                          Outcome : in out Unbounded_String);

   procedure Load_User (Data    : in out Authenticate_Bean;
                        Outcome : in out Unbounded_String);

   --  Create an authenticate bean.
   function Create_Authenticate_Bean (Module : in AWA.Users.Modules.User_Module_Access)
                                      return Util.Beans.Basic.Readonly_Bean_Access;

   --  ------------------------------
   --  Current user
   --  ------------------------------
   --  The <b>Current_User_Bean</b> provides information about the current user.
   --  It relies on the <b>AWA.Services.Contexts</b> to identify the current user
   --  and return information about him/her.
   type Current_User_Bean is new Util.Beans.Basic.Readonly_Bean with null record;
   type Current_User_Bean_Access is access all Current_User_Bean'Class;

   --  Attributes exposed by <b>Current_User_Bean</b>
   IS_LOGGED_ATTR  : constant String := "isLogged";
   USER_EMAIL_ATTR : constant String := "email";
   USER_NAME_ATTR  : constant String := "name";
   USER_ID_ATTR    : constant String := "id";

   --  Get the value identified by the name.  The following names are recognized:
   --    o isLogged  Boolean  True if a user is logged
   --    o name      String   The user name
   --    o email     String   The user email address
   --    o id        Long     The user identifier
   overriding
   function Get_Value (From : in Current_User_Bean;
                       Name : in String) return Util.Beans.Objects.Object;

   --  Create the current user bean.
   function Create_Current_User_Bean (Module : in AWA.Users.Modules.User_Module_Access)
                                      return Util.Beans.Basic.Readonly_Bean_Access;

end AWA.Users.Beans;
