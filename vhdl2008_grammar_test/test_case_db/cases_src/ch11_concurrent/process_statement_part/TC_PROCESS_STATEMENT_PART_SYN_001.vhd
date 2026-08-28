-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: The simplest single sequential statement——the process body has only one `q <= d;`, verifying the smallest non-empty form of process_statement_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity psp_min_ent is
  port(clk, d : in bit; q : out bit);
end entity psp_min_ent;
architecture bh of psp_min_ent is
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      q <= d;
    end if;
  end process;
end architecture bh;
