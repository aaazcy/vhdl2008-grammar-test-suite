-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Positive
-- Test Focus: discrete_range with downto direction in array index
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dr_syn_downto is port(dout:out integer); end entity;
architecture rtl of dr_syn_downto is
  type t_vec is array(7 downto 0) of integer;
  signal s:t_vec:=(others=>0);
begin s(7)<=42; dout<=s(7); end architecture;