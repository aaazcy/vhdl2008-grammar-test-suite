-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_009
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Negative
-- Test Focus: SMN: choices do not cover all values of the case expression and there is no when others - integer range 0 to 3 has only when 0 or 1 or 2, missing 3 and without others
-- Expected Result: Triggers semantic error: choices do not cover all values of case expression
-- Dependencies: None
-- =============================================================
entity csa_smn1_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of csa_smn1_ent is
begin
  process(sel) begin
    case sel is
      when 0 => y <= 10;
      when 1 => y <= 20;
      when 2 => y <= 30;
    end case;
  end process;
end architecture bh;
