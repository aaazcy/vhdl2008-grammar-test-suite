-- =============================================================
-- Case ID: TC_CONDITION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition: boolean expression with relational operators (= < >) in concurrent conditional signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity condition_syn7_ent is port(addr:in integer range 0 to 15; y:out bit); end entity;
architecture bh of condition_syn7_ent is
begin
  y <= '1' when addr<8 else '0' when addr>=8 and addr<12 else '1';
end architecture bh;
