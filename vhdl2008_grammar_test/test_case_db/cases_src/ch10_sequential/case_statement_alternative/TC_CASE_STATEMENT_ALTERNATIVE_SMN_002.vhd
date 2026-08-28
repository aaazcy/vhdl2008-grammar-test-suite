-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_009
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Negative
-- Test Focus: SMN: choices contain duplicate values - when 1 or 2 or 3 overlaps with when 2 or 3, choice values 2 and 3 are covered twice
-- Expected Result: Triggers semantic error: duplicate choice value in case alternatives
-- Dependencies: None
-- =============================================================
entity csa_smn2_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of csa_smn2_ent is
begin
  process(sel) begin
    case sel is
      when 0|1|2 => y <= 100;
      when 2|3   => y <= 200;
      when others => y <= 0;
    end case;
  end process;
end architecture bh;
