-- =============================================================
-- Case ID: TC_DESIGN_FILE_SYN_003
-- Rule Type: Syntax
-- BNF Production: design_file
-- IEEE Section: 13.1
-- BNF Text: design_file ::= design_unit { design_unit }
-- Test Focus: design_file with explicit primary and secondary units as separate design_units
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Design unit: primary unit (entity)
entity tc_design_file_syn_003 is
  port (
    sel : in  bit;
    d0  : in  bit;
    d1  : in  bit;
    y   : out bit
  );
end entity tc_design_file_syn_003;

-- Design unit: secondary unit (architecture)
architecture rtl of tc_design_file_syn_003 is
begin
  y <= d0 when sel = '0' else d1;
end architecture rtl;
