-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent ::= name | character_literal
-- Case Type: Negative
-- Test Focus: group_constituent: operator symbol used where name or character_literal expected
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gc_operator_symbol_err is
  port (
    flag : out bit
  );
end entity gc_operator_symbol_err;

architecture snerr of gc_operator_symbol_err is
  group op_list is (signal <>);
  signal s_a, s_b : bit := '0';
  -- ERROR: operator symbol "+" is not a valid group_constituent (must be name or character_literal)
  group broken : op_list (+);
begin
  flag <= '0';
end architecture snerr;
