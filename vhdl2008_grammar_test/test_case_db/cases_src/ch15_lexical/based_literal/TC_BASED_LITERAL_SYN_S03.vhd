-- =============================================================
-- Case ID: TC_BASED_LITERAL_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Positive
-- Test Focus: based literal with dot (fixed-point)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bl_spc3_ent is port(r:out integer); end entity;
architecture bh of bl_spc3_ent is
  constant c_h:real:=16#A.B#;
  constant c_o:real:=8#7.7#;
begin r<=integer(c_h+c_o); end architecture bh;
