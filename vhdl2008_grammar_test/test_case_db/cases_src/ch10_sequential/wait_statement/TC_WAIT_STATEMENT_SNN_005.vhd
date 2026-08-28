-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Negative
-- Test Focus: SNN: No wait after label colon — `lbl: on clk;` lacks the wait keyword, verifying that the wait keyword must follow the label
-- Expected Result: Triggers syntax error: expected 'wait' keyword after label
-- Dependencies: None
-- =============================================================
entity wait_label_only_ent is
  port (clk : in bit; flag : out bit);
end entity wait_label_only_ent;

architecture err of wait_label_only_ent is
begin
  process is
  begin
    flag <= '0';
    sync_wait: on clk;  -- ERROR: label with no 'wait' keyword
    flag <= '1';
  end process;
end architecture err;
