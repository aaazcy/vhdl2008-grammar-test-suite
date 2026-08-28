-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit ::= entity_declaration | configuration_declaration | package_declaration
-- Case Type: Positive
-- Test Focus: primary_unit as package_declaration defining constants
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pu_syn_pkg is port(dout:out integer); end entity;
architecture rtl of pu_syn_pkg is
  package p is
    constant C_VAL : integer := 42;
  end package;
begin
  dout<=p.C_VAL;
end architecture rtl;
