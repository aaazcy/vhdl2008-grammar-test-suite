-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit ::= entity_declaration | configuration_declaration | package_declaration
-- Case Type: Positive
-- Test Focus: SEMANTIC -- primary_unit entity with architecture instantiating component-like structure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pu_sem_inst is port(a:in integer; dout:out integer); end entity;
architecture rtl of pu_sem_inst is
  signal s : integer := 0;
begin
  s <= a * 2;
  dout <= s;
end architecture rtl;
