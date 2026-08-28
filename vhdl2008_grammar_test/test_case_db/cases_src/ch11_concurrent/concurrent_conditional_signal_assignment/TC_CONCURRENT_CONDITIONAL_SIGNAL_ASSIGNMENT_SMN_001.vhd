-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CCSA_BRANCH_TYPE
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Rule Description: All branches of a conditional signal assignment must match the target type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: the branch type of the concurrent conditional signal assignment does not match the target — in y <= d when en='1' else true the else branch is of boolean type, mismatching the integer target y
-- Expected Result: Triggers analysis error: can't match "true" with type integer
-- Dependencies: None
-- =============================================================
entity ccsa_branch_type is port(en:in bit; d:in integer; y:out integer); end entity;
architecture vhdl2008 of ccsa_branch_type is
begin
  y <= d when en='1' else true;
end architecture vhdl2008;
