-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | ... | null_statement
-- Case Type: Positive
-- Test Focus: case_statement as a sequential_statement — case sel is when 0=>... end case inside a process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn4_ent is port(sel:in integer range 0 to 1; a,b:in integer; y:out integer); end entity;
architecture bh of sqs_syn4_ent is
begin
  process(sel,a,b) is
  begin
    case sel is
      when 0 => y <= a;
      when 1 => y <= b;
    end case;
  end process;
end architecture bh;
