-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Negative
-- Test Focus: SNN: EOF truncation - `when 0 =>` is followed directly by end case, with no sequence_of_statements
-- Expected Result: Triggers syntax error: unexpected 'end case', expected sequential statement
-- Dependencies: None
-- =============================================================
entity csa_snn4_ent is port(sel:in integer range 0 to 1; y:out integer); end entity;
architecture bh of csa_snn4_ent is
begin
  process(sel) begin
    case sel is
      when 0 =>
    end case;
  end process;
end architecture bh;
