-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Positive
-- Test Focus: minimal library_unit — primary_unit (entity): entity with a minimal port declaration, verifies primary_unit as the minimal compilable form of library_unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lu_min_ent is
  port (
    a : in  bit;
    y : out bit
  );
end entity lu_min_ent;

architecture rtl of lu_min_ent is
begin
  y <= a;
end architecture rtl;
