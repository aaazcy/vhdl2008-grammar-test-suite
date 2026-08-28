-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Positive
-- Test Focus: With timeout_clause: `wait for 10 ns;` — verifying that wait can carry the for timeout clause to achieve timed waiting
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wait_for_timeout_ent is
  port (
    trigger : in  bit;
    pulse   : out bit
  );
end entity wait_for_timeout_ent;

architecture timer of wait_for_timeout_ent is
begin
  process is
  begin
    pulse <= '1';
    wait for 10 ns;
    pulse <= '0';
    wait for 90 ns;
  end process;
end architecture timer;
