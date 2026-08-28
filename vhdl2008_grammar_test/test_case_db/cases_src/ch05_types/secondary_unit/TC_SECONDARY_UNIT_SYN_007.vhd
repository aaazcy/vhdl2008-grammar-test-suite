-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Positive
-- Test Focus: Positive: architecture body with component instantiation pattern
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: architecture body with component instantiation pattern
entity sec_unit_syn_comp is port(dout:out integer); end entity;
architecture rtl of sec_unit_syn_comp is
  component dummy is port(x:out integer); end component;
  signal s:integer:=0;
begin
  u: dummy port map(x=>s);
  dout<=s;
end architecture;