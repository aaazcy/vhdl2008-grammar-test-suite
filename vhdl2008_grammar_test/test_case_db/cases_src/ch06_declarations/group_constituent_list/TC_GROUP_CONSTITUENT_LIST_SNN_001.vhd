-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_LIST_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent_list ::= group_constituent { , group_constituent }
-- Case Type: Negative
-- Test Focus: group_constituent_list: missing comma between constituents
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gcl_missing_comma_err is
  port (
    flag : out bit
  );
end entity gcl_missing_comma_err;

architecture snerr of gcl_missing_comma_err is
  group triple is (signal <>, signal <>, signal <>);
  signal s_a : bit := '0';
  signal s_b : bit := '0';
  signal s_c : bit := '0';
  -- ERROR: missing comma between s_a and s_b in group_constituent_list
  group broken : triple (s_a s_b, s_c);
begin
  flag <= '0';
end architecture snerr;
