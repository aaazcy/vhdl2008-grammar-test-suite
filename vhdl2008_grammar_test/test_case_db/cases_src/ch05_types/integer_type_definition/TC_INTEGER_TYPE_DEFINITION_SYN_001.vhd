-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.3
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: Integer type all range forms: ascending(0 to 255) / descending(255 downto 0) / based literal bounds(16#00# to 16#FF#) / expression bounds(2**8-1 downto 0) / negative bounds(-128 to 127), verifying all legal forms of the range_constraint of integer_type_definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity int_ent is port(y:out integer); end entity;
architecture bh of int_ent is
  type t_asc  is range 0 to 255;
  type t_desc is range 255 downto 0;
  type t_hex  is range 16#00# to 16#FF#;
  type t_expr is range 0 to 2**8-1;
  type t_sgn  is range -128 to 127;
  signal s_a:t_asc:=200; signal s_d:t_desc:=100; signal s_s:t_sgn:= -64;
begin
  y<=integer(s_a)+integer(s_d)+integer(s_s);
end architecture bh;
