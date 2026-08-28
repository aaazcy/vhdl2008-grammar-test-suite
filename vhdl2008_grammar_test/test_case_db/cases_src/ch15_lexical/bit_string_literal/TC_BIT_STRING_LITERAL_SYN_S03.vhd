-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Positive
-- Test Focus: decimal bit string (D format, 2008)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bsl_spc3_ent is port(r:out integer); end entity;
architecture bh of bsl_spc3_ent is
  signal sd:bit_vector(7 downto 0):=D"255";
begin r<=1; end architecture bh;
