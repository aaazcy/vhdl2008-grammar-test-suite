-- =============================================================
-- Case ID: TC_BASED_LITERAL_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Positive
-- Test Focus: based literal with exponent (real)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bl_spc2_ent is port(r:out integer); end entity;
architecture bh of bl_spc2_ent is
  constant c_r:real:=16#F.FF#e2;
begin r<=integer(c_r); end architecture bh;
