-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | ... | null_statement
-- Case Type: Positive
-- Test Focus: loop_statement + exit_statement + next_statement as sequential_statement — a for loop containing exit when and next when
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn5_ent is port(lim:in integer; y:out integer); end entity;
architecture bh of sqs_syn5_ent is
begin
  process(lim) is
    variable v : integer := 0;
  begin
    v := 0;
    for i in 0 to 15 loop
      next when i < lim;
      exit when i > 10;
      v := v + i;
    end loop;
    y <= v;
  end process;
end architecture bh;
