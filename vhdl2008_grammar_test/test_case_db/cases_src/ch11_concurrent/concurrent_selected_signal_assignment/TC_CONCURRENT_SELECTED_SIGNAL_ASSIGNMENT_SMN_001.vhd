-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CSSA_DUPLICATE
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Rule Description: Duplicate choices in concurrent selected assignment
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: duplicate choice value in concurrent selected signal assignment
-- Expected Result: Triggers semantic error: duplicate choice
-- Dependencies: None
-- =============================================================
entity cssa_smn1_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of cssa_smn1_ent is
begin
  with sel select y <=
    10 when 0,
    20 when 0,
    30 when others;
end architecture bh;
