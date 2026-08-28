-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Negative
-- Test Focus: SNN: missing choices - `when => y<=a` has when and => but no choices
-- Expected Result: Triggers syntax error: missing choices after 'when'
-- Dependencies: None
-- =============================================================
entity csa_snn3_ent is port(sel:in integer range 0 to 1; y:out integer); end entity;
architecture bh of csa_snn3_ent is
begin
  process(sel) begin
    case sel is
      when => y <= 1;
    end case;
  end process;
end architecture bh;
