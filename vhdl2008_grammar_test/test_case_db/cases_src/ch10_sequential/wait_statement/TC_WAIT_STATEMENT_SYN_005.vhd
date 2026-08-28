-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Positive
-- Test Focus: Full clause combination: `wait on clk until clk='1' for 100 ns;` — verifying that the three clauses on/until/for of wait can be combined together
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wait_full_clauses_ent is
  port (
    clk    : in  bit;
    data   : in  bit_vector(7 downto 0);
    strobe : out bit
  );
end entity wait_full_clauses_ent;

architecture receiver of wait_full_clauses_ent is
begin
  process is
  begin
    strobe <= '0';
    wait on clk until clk = '1' for 1 us;
    strobe <= '1';
    wait for 5 ns;
    strobe <= '0';
  end process;
end architecture receiver;
