-- =============================================================
-- Case ID: TC_SLICE_NAME_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Positive
-- Test Focus: slice with ascending range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sl_spc2_ent is port(r:out integer); end entity;
architecture bh of sl_spc2_ent is
  signal v:bit_vector(0 to 15):=(others=>'0');
  signal s:bit_vector(0 to 7);
begin s<=v(0 to 7); r<=1; end architecture bh;
