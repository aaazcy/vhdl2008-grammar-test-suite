-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Positive
-- Test Focus: Scalar type all 4 kinds: enum(RED,GREEN,BLUE) / integer(0..255) / float(0.0..1.0) / physical(Ohm/kOhm), verifying the four discrete types of scalar_type_definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity std_ent is port(y:out integer); end entity;
architecture bh of std_ent is
  type t_enum is (RED,GREEN,BLUE);
  type t_int  is range 0 to 255;
  type t_float is range 0.0 to 1.0;
  type t_phys is range 0 to 1000000 units Ohm; kOhm=1000 Ohm; end units;
  signal s_e:t_enum:=RED; signal s_i:t_int:=128;
begin y<=integer(s_i); end architecture bh;
