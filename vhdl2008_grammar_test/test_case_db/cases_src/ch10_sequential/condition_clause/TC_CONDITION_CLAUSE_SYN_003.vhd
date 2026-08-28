-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Positive
-- Test Focus: wait on + until coexisting - `wait on req until ack='1'` - sensitivity_clause + condition_clause used together
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cc_syn3_ent is port(req,ack:in bit; y:out integer); end entity;
architecture bh of cc_syn3_ent is
begin
  process is
  begin
    wait on req until ack = '1';
    y <= 1;
  end process;
end architecture bh;
