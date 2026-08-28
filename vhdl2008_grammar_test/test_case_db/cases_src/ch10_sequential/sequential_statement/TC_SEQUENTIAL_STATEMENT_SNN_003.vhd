-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | assertion_statement | ... | null_statement
-- Case Type: Negative
-- Test Focus: SNN: incomplete if statement missing end if — the if lacks the closing end if, causing subsequent statements to be misparsed as part of the if
-- Expected Result: Triggers syntax error: missing 'end if'
-- Dependencies: None
-- =============================================================
entity sqs_snn3_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sqs_snn3_ent is
begin
  process(a) is
  begin
    if a > 0 then
      y <= a;
    y <= 0;
  end process;
end architecture bh;
