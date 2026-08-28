-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | ... | null_statement
-- Case Type: Positive
-- Test Focus: if_statement + null_statement as sequential_statement — `if sel='1' then y<=a; else null; end if` inside a process verifying if and null
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn3_ent is port(a,b:in integer; sel:in bit; y:out integer); end entity;
architecture bh of sqs_syn3_ent is
begin
  process(a,b,sel) is
  begin
    if sel = '1' then y <= a; else null; end if;
  end process;
end architecture bh;
