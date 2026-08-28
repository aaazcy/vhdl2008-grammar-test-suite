-- =============================================================
-- Case ID: TC_DESIGN_FILE_SNN_003
-- Rule Type: Syntax
-- BNF Production: design_file
-- IEEE Section: 13.1
-- BNF Text: design_file ::= design_unit { design_unit }
-- Test Focus: Invalid design_file — architecture references non-existent entity
-- Case Type: Negative
-- Expected Result: Triggers error: secondary unit without matching primary unit
-- Dependencies: None
-- =============================================================
entity tc_design_file_snn_003 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_design_file_snn_003;

architecture rtl of nonexistent_entity_x is  -- ERROR: no matching primary unit
begin
  y <= a;  -- y is not declared in this architecture's entity
end architecture rtl;
