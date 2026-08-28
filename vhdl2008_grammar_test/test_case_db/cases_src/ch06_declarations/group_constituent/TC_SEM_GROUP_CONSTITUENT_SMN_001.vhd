-- =============================================================
-- Case ID: TC_SEM_GROUP_CONSTITUENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent ::= name | character_literal
-- Case Type: Negative
-- Test Focus: group_constituent: name references undeclared identifier — semantic error
-- Expected Result: Triggers semantic error (undefined identifier)
-- Dependencies: None
-- =============================================================
entity gc_undefined_name_sem is
  port (
    flag : out bit
  );
end entity gc_undefined_name_sem;

architecture semerr of gc_undefined_name_sem is
  group sensor_pair is (signal <>, signal <>);
  -- ERROR: 'sensor_ready' is not declared — semantic error
  group broken : sensor_pair (sensor_ready, sensor_done);
begin
  flag <= '0';
end architecture semerr;
