-- =============================================================
-- Case ID: TC_DESIGN_FILE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_FILE
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Negative
-- Test Focus: invalid design_file - bare signal declaration: signal bad : bit; placed at the design_unit position — every component of a design_file must be a design_unit (context_clause + library_unit); a bare signal declaration is not a valid design_unit
-- Expected Result: Triggers syntax error: unexpected signal declaration, expected design_unit
-- Dependencies: None
-- =============================================================

signal bad_sig : bit;

entity df4_valid_ent is
  port (
    y : out bit
  );
end entity df4_valid_ent;

architecture rtl of df4_valid_ent is
begin
  y <= '0';
end architecture rtl;
