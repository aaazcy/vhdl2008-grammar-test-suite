-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Positive
-- Test Focus: signed/unsigned base specifiers (UB,UX,SB,SX)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bsl_spc2_ent is port(r:out integer); end entity;
architecture bh of bsl_spc2_ent is
  signal su:bit_vector(7 downto 0):=UX"FF";
  signal ss:bit_vector(7 downto 0):=SX"80";
begin r<=1; end architecture bh;
