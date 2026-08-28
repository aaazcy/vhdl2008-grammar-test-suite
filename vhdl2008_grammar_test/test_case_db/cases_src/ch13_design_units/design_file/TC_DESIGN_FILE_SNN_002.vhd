-- =============================================================
-- Case ID: TC_DESIGN_FILE_SNN_002
-- Rule Type: Syntax
-- BNF Production: design_file
-- IEEE Section: 13.1
-- BNF Text: design_file ::= design_unit { design_unit }
-- Test Focus: Invalid design_file — bare signal declaration is not a valid design_unit
-- Case Type: Negative
-- Expected Result: Triggers syntax error: signal declaration at design_file level
-- Dependencies: None
-- =============================================================
signal err_at_file_level : bit;  -- ERROR: not a valid design_unit

entity tc_design_file_snn_002 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_design_file_snn_002;

architecture rtl of tc_design_file_snn_002 is
begin
  y <= a;
end architecture rtl;
