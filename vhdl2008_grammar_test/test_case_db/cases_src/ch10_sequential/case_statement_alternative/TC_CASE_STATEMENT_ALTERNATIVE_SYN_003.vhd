-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Positive
-- Test Focus: when choices=> with a range choice: when 0 to 7 => y<=1 - a discrete_range form choice covering a continuous interval
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn3_ent is port(sel:in integer range 0 to 15; y:out integer); end entity;
architecture bh of csa_syn3_ent is
begin
  process(sel) begin
    case sel is
      when 0 to 7 => y <= 1;
      when 8 to 15 => y <= 2;
    end case;
  end process;
end architecture bh;
