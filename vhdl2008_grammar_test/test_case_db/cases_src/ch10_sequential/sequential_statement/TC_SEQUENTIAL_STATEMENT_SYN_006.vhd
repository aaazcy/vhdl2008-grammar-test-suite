-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | ... | null_statement
-- Case Type: Positive
-- Test Focus: wait_statement as a sequential_statement — `wait on clk` inside a process uses wait to control process suspension
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn6_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of sqs_syn6_ent is
  signal s_cnt : integer := 0;
begin
  process is
  begin
    wait on clk;
    if clk = '1' then s_cnt <= s_cnt + 1; end if;
    y <= s_cnt;
  end process;
end architecture bh;
