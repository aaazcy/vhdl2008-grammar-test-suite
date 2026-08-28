-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Positive
-- Test Focus: library_unit as configuration_declaration (primary_unit alternative form): configuration binds entity and architecture — verifies configuration_declaration as a primary_unit alternative form is a legal library_unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity lu_cfg_ent is
  port (
    a : in  bit;
    y : out bit
  );
end entity lu_cfg_ent;

architecture behav of lu_cfg_ent is
begin
  y <= a;
end architecture behav;

architecture rtl of lu_cfg_ent is
  signal s : bit;
begin
  s <= a;
  y <= s;
end architecture rtl;

configuration lu_cfg of lu_cfg_ent is
  for behav
  end for;
end configuration lu_cfg;
