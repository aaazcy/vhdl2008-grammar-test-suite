-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Positive
-- Test Focus: SEMANTIC: architecture body referencing entity ports correctly
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- SEMANTIC: architecture body referencing entity ports correctly
entity sec_unit_sem_ports is port(a:in integer; dout:out integer); end entity;
architecture rtl of sec_unit_sem_ports is
  signal s:integer:=0;
begin s<=a*2; dout<=s; end architecture;