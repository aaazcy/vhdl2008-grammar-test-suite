-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Positive
-- Test Focus: With condition_clause: `wait until ready = '1';` — verifying that wait can carry the until condition clause to achieve conditional waiting
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wait_until_cond_ent is
  port (
    request : in  bit;
    grant   : out bit
  );
end entity wait_until_cond_ent;

architecture arbiter of wait_until_cond_ent is
  signal s_ready : bit := '1';
begin
  process is
  begin
    grant <= '0';
    wait until request = '1';
    grant <= s_ready;
    wait until request = '0';
  end process;
end architecture arbiter;
