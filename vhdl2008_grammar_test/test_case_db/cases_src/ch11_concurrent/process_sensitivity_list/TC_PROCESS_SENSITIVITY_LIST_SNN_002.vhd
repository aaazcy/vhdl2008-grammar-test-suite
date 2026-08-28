-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | sensitivity_list
-- Case Type: Negative
-- Test Focus: process_sensitivity_list: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity process_sensiti_e2 is end entity;
architecture bh of process_sensiti_e2 is
  -- ERROR: invalid syntax in process_sensitivity_list
  signal s : bit;
begin
  s <= '1'
end architecture bh;