-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | sensitivity_list
-- Case Type: Negative
-- Test Focus: process_sensitivity_list: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity process_sensiti_e3 is end entity;
architecture bh of process_sensiti_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;