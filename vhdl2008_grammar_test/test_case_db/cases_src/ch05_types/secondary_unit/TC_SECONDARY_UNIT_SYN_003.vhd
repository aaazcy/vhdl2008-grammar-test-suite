-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Positive
-- Test Focus: Positive: secondary_unit as an architecture_body with concurrent assignments
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: secondary_unit as an architecture_body with concurrent assignments
entity sec_unit_syn_arch is port(dout:out integer); end entity;
architecture rtl of sec_unit_syn_arch is
  signal s_a:integer:=10; signal s_b:integer:=20;
begin s_a<=s_a+1 after 1 ns; dout<=s_a+s_b; end architecture;