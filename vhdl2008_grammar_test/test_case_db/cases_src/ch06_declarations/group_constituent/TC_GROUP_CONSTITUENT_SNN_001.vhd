-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent ::= name | character_literal
-- Case Type: Negative
-- Test Focus: group_constituent: integer literal used where name or character_literal expected
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gc_integer_literal_err is
  port (
    flag : out bit
  );
end entity gc_integer_literal_err;

architecture snerr of gc_integer_literal_err is
  group num_list is (integer <>);
  signal s_val : integer := 0;
  -- ERROR: integer literal '42' is not a valid group_constituent (must be name or character_literal)
  group broken : num_list (42);
begin
  flag <= '0';
end architecture snerr;
