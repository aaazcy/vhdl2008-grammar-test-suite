-- =============================================================
-- Case ID: TC_DESIGN_FILE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: design_file
-- IEEE Section: 13.1
-- BNF Text: design_file ::= design_unit { design_unit }
-- Test Focus: Single design_unit in a design_file — minimal valid compilation unit
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_design_file_syn_s01 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_design_file_syn_s01;

architecture rtl of tc_design_file_syn_s01 is
begin
  y <= a;
end architecture rtl;
