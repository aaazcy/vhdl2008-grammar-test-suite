-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Positive
-- Test Focus: index_constraint with enumeration type discrete_range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ic_syn_enum is port(dout:out integer); end entity;
architecture rtl of ic_syn_enum is
  type t_color is (RED,GREEN,BLUE);
  type t_rgb is array(t_color range <>) of integer range 0 to 255;
  subtype t_rgb_constrained is t_rgb(RED to BLUE);
  signal s:t_rgb_constrained:=(RED=>255,GREEN=>128,BLUE=>64);
begin dout<=s(RED)+s(GREEN)+s(BLUE); end architecture;