-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_LIST_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent_list ::= group_constituent { , group_constituent }
-- Case Type: Negative
-- Test Focus: group_constituent_list: trailing comma before closing parenthesis
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gcl_trailing_comma_err is
  port (
    flag : out bit
  );
end entity gcl_trailing_comma_err;

architecture snerr of gcl_trailing_comma_err is
  group pair is (signal <>, constant <>);
  signal s_clk : bit := '0';
  constant C_RST : bit := '1';
  -- ERROR: trailing comma in group_constituent_list not allowed by BNF
  group broken : pair (s_clk, C_RST, );
begin
  flag <= '0';
end architecture snerr;
