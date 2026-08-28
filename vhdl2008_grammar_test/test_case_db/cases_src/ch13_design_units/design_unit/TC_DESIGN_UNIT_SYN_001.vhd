-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Positive
-- Test Focus: minimal design_unit - empty context_clause + entity primary_unit: no library/use/context preamble needed, starting directly with entity, verifying the context_clause may be empty ({ context_item } repeated zero times) and the library_unit is the minimal primary_unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity du_min_ent is
  port (
    a : in  bit;
    y : out bit
  );
end entity du_min_ent;

architecture rtl of du_min_ent is
begin
  y <= a;
end architecture rtl;
