-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Positive
-- Test Focus: discrete_range as subtype_indication (integer range 0 to 7)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dr_syn_subtype is port(dout:out integer); end entity;
architecture rtl of dr_syn_subtype is
  type t_vec is array(integer range 0 to 7) of integer;
  signal s:t_vec:=(others=>0);
begin s(0)<=1; dout<=s(0); end architecture;