-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Negative
-- Test Focus: Syntax error -- package body without corresponding package declaration
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity sec_unit_snn_no_pkg is end entity;
architecture rtl of sec_unit_snn_no_pkg is
  package body orphan is  -- ERROR: no package declaration for 'orphan'
    constant C : integer := 0;
  end package body;
begin end architecture;